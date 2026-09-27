#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Convert ECON 621 Markdown chapters to LaTeX.
All string delimiters are plain ASCII quotes.
"""
import re
import pathlib

# ================================================================
#  MATH PLACEHOLDER STORE
#  Everything between $...$ or $$...$$ is swapped out before
#  any text processing, then restored at the end.
# ================================================================

_STORE = {}
_CTR = [0]

def _store(content, display=False):
    key = "XMXMX%dX" % _CTR[0]
    _CTR[0] += 1
    if display:
        _STORE[key] = "\\[\n%s\n\\]" % content
    else:
        _STORE[key] = "$%s$" % content
    return key

def _restore(s):
    for k, v in _STORE.items():
        s = s.replace(k, v)
    return s

def _clear():
    _STORE.clear()
    _CTR[0] = 0


def preprocess_display_math(text):
    """Replace $$...$$ display math with placeholders.
    Handles:
      1. Single-line:  $$content$$
      2. Multi-line:   $$start...
                         ...end$$
    Also handles $$ inside blockquote lines (starting with > ).
    """
    result = []
    lines  = text.split('\n')
    i = 0
    while i < len(lines):
        line = lines[i]
        # Strip blockquote markers and whitespace to detect $$
        stripped = re.sub(r'^[\s>]+', '', line)

        # Does this line begin a display-math block?
        if stripped.startswith('$$'):
            after_open = stripped[2:]          # text after opening $$

            # Case A: single-line  $$...$$  (content ends with $$)
            if after_open.endswith('$$') and len(after_open) > 2:
                inner = after_open[:-2]        # strip closing $$
                result.append(_store(inner.strip(), display=True))
                i += 1
                continue

            # Case B: opening $$ with single-line content but $$  alone
            # e.g. a line that is exactly "$$" on its own (delimiter style)
            if stripped == '$$':
                # Collect lines until next standalone $$
                math_lines = []
                i += 1
                while i < len(lines):
                    if lines[i].strip() == '$$':
                        i += 1
                        break
                    math_lines.append(lines[i])
                    i += 1
                result.append(_store('\n'.join(math_lines).strip(), display=True))
                continue

            # Case C: opening $$ with content that continues on subsequent lines
            #  e.g. "$$\mathbf{y} = \begin{pmatrix}" (no closing $$ on this line)
            math_lines = [after_open]
            i += 1
            while i < len(lines):
                cur = lines[i]
                stripped_cur = cur.rstrip()
                if stripped_cur.endswith('$$'):
                    math_lines.append(stripped_cur[:-2])  # drop closing $$
                    i += 1
                    break
                math_lines.append(cur)
                i += 1
            inner = '\n'.join(math_lines).strip()
            result.append(_store(inner, display=True))
            continue

        result.append(line)
        i += 1

    return '\n'.join(result)


# Placeholder for Markdown escaped dollars  \$  → LaTeX  \$
_ESCAPED_DOLLAR = 'XDOLLARX'

def protect_escaped_dollars(s):
    """Replace \\$ (Markdown currency) with a placeholder before math extraction."""
    return s.replace('\\$', _ESCAPED_DOLLAR)

def restore_escaped_dollars(s):
    """Restore currency dollar signs as LaTeX \\$."""
    return s.replace(_ESCAPED_DOLLAR, r'\$')

def extract_inline_math(s):
    """Replace $...$ inline math with placeholders.
    Must be called AFTER protect_escaped_dollars so \\$ is not mis-read."""
    result = []
    i = 0
    while i < len(s):
        ch = s[i]
        if ch == '$':
            # Find closing $ (not preceded by backslash)
            j = i + 1
            while j < len(s) and not (s[j] == '$' and s[j-1] != '$'):
                j += 1
            if j < len(s) and j > i + 1:
                inner = s[i+1:j]
                # Treat as math if: no newline AND not purely digit/currency amount
                if '\n' not in inner and not re.match(r'^\s*[\d,\.]+\s*$', inner):
                    result.append(_store(inner))
                    i = j + 1
                    continue
        result.append(ch)
        i += 1
    return ''.join(result)


# ================================================================
#  UNICODE REPLACEMENT
#  Math symbols get stored as placeholders so escape_latex() won't
#  touch the $ we insert. Text punct is replaced directly.
# ================================================================

# Pairs: (unicode_char_as_utf8_string, latex_math_body)
UNICODE_MATH = [
    ("✓", r"\checkmark"), # CHECK MARK
    ("✗", r"\times"),     # BALLOT X
    ("↑", r"\uparrow"),   # UP ARROW
    ("↓", r"\downarrow"), # DOWN ARROW
    ("²", "^{2}"),        # SUPERSCRIPT TWO
    ("³", "^{3}"),        # SUPERSCRIPT THREE
    ("−", "-"),           # MINUS SIGN
    ("≈", r"\approx"),    # ALMOST EQUAL TO
    ("≠", r"\neq"),       # NOT EQUAL TO
    ("≡", r"\equiv"),     # IDENTICAL TO
    ("≤", r"\leq"),       # LESS-THAN OR EQUAL TO
    ("≥", r"\geq"),       # GREATER-THAN OR EQUAL TO
    ("→", r"\to"),        # RIGHTWARDS ARROW
    ("←", r"\leftarrow"), # LEFTWARDS ARROW
    ("×", r"\times"),     # MULTIPLICATION SIGN
    ("⊥", r"\perp"),      # UP TACK
    ("∈", r"\in"),        # ELEMENT OF
    ("·", r"\cdot"),      # MIDDLE DOT
    ("⊆", r"\subseteq"),  # SUBSET OF OR EQUAL TO
    ("∞", r"\infty"),     # INFINITY
    ("∂", r"\partial"),   # PARTIAL DIFFERENTIAL
    ("∑", r"\sum"),       # N-ARY SUMMATION
    ("α", r"\alpha"),     # GREEK SMALL LETTER ALPHA
    ("β", r"\beta"),      # GREEK SMALL LETTER BETA
    ("ρ", r"\rho"),       # GREEK SMALL LETTER RHO
    ("δ", r"\delta"),     # GREEK SMALL LETTER DELTA
    ("Δ", r"\Delta"),     # GREEK CAPITAL LETTER DELTA
    ("σ", r"\sigma"),     # GREEK SMALL LETTER SIGMA
    ("Σ", r"\Sigma"),     # GREEK CAPITAL LETTER SIGMA
    ("γ", r"\gamma"),     # GREEK SMALL LETTER GAMMA
    ("τ", r"\tau"),       # GREEK SMALL LETTER TAU
    ("ε", r"\epsilon"),   # GREEK SMALL LETTER EPSILON
    ("μ", r"\mu"),        # GREEK SMALL LETTER MU
    ("λ", r"\lambda"),    # GREEK SMALL LETTER LAMBDA
]

# Plain text Unicode replacements (no $ needed)
UNICODE_TEXT = [
    ("…", r"\ldots{}"),  # HORIZONTAL ELLIPSIS
    ("—", "---"),         # EM DASH
    ("–", "--"),          # EN DASH
    ("“", "``"),          # LEFT DOUBLE QUOTATION MARK
    ("”", "''"),          # RIGHT DOUBLE QUOTATION MARK
    ("‘", "`"),           # LEFT SINGLE QUOTATION MARK
    ("’", "'"),           # RIGHT SINGLE QUOTATION MARK
]


def replace_unicode(s):
    for uni, cmd in UNICODE_MATH:
        if uni in s:
            s = s.replace(uni, _store(cmd, display=False))
    for uni, tex in UNICODE_TEXT:
        s = s.replace(uni, tex)
    return s


# ================================================================
#  LATEX CHARACTER ESCAPING  (for text outside math/placeholders)
# ================================================================

def escape_latex(s):
    result = []
    i = 0
    while i < len(s):
        # skip over XMXMX placeholders without escaping them
        m = re.match(r'XMXMX\d+X', s[i:])
        if m:
            result.append(m.group(0))
            i += len(m.group(0))
            continue
        ch = s[i]
        # Already a LaTeX command backslash? Pass through
        if ch == '\\' and i + 1 < len(s) and (s[i+1].isalpha() or s[i+1] in '{}'):
            result.append(ch)
            i += 1
            continue
        if ch == '\\':
            result.append(r'\textbackslash{}')
        elif ch == '$':
            result.append(r'\$')
        elif ch == '%':
            result.append(r'\%')
        elif ch == '#':
            result.append(r'\#')
        elif ch == '_':
            result.append(r'\_')
        elif ch == '^':
            result.append(r'\^{}')
        elif ch == '~':
            result.append(r'\textasciitilde{}')
        elif ch == '&':
            result.append(r'\&')
        elif ch == '{':
            result.append(r'\{')
        elif ch == '}':
            result.append(r'\}')
        else:
            result.append(ch)
        i += 1
    return ''.join(result)


# ================================================================
#  INLINE FORMATTING PIPELINE
# ================================================================

def process_inline(s):
    s = protect_escaped_dollars(s)   # protect \$ before math extraction
    s = extract_inline_math(s)       # protect $...$ spans
    s = replace_unicode(s)           # unicode → math placeholders
    s = escape_latex(s)              # escape LaTeX specials in plain text
    # **bold**
    s = re.sub(r'\*\*(.+?)\*\*', r'\\textbf{\1}', s, flags=re.DOTALL)
    # *italic*
    s = re.sub(r'(?<!\*)\*(?!\*)(.+?)(?<!\*)\*(?!\*)', r'\\textit{\1}', s)
    # `inline code`
    s = re.sub(r'`([^`\n]+)`',
               lambda m: r'\texttt{' + m.group(1) + '}', s)
    # [text](url) -- drop URL
    s = re.sub(r'\[([^\]]+)\]\([^\)]+\)', r'\1', s)
    s = _restore(s)
    s = restore_escaped_dollars(s)   # restore \$ currency symbols
    return s


def process_cell(s):
    """Table cell: same as process_inline but we need literal & for table column
    separators, which we have already split on BEFORE calling this."""
    return process_inline(s)


# ================================================================
#  TABLE CONVERTER
# ================================================================

def make_table(lines):
    rows = []
    for line in lines:
        cells = [c.strip() for c in line.strip().strip('|').split('|')]
        rows.append(cells)
    if len(rows) < 2:
        return ''
    header = rows[0]
    ncols  = len(header)
    # skip separator row (row[1]) -- rows with only dashes
    data = [r for r in rows[2:]
            if not all(re.match(r'^:?-+:?$', c.strip() or '-') for c in r)]
    colspec = '@{} ' + ' '.join(['l'] * ncols) + ' @{}'
    out = [
        r'\begin{center}',
        r'\begin{tabular}{' + colspec + '}',
        r'\toprule',
    ]
    hdr_cells = ' & '.join(r'\textbf{' + process_cell(h) + '}' for h in header)
    out.append(hdr_cells + r' \\')
    out.append(r'\midrule')
    for row in data:
        while len(row) < ncols:
            row.append('')
        out.append(' & '.join(process_cell(c) for c in row[:ncols]) + r' \\')
    out += [r'\bottomrule', r'\end{tabular}', r'\end{center}']
    return '\n'.join(out)


# ================================================================
#  LIST HELPERS
# ================================================================

def is_ulist(line):
    return bool(re.match(r'^(\s*)[-*]\s', line))

def is_olist(line):
    return bool(re.match(r'^(\s*)\d+\.\s', line))

def strip_marker(line):
    return re.sub(r'^(\s*)([-*]|\d+\.)\s', '', line)


# ================================================================
#  BOX / CALLOUT STARTERS
# ================================================================

BOX_STARTERS = (
    '**Box ', '**Warning', '**Note', '**Key Takeaway',
    '**Key Insight', '**Practical', '**Rule of Thumb',
    '**Equation ', '**Important', '**Figure ', '**Table ',
    '**The Rule',
)


# ================================================================
#  MAIN CHAPTER CONVERTER
# ================================================================

def convert_chapter(md_text):
    _clear()
    text = preprocess_display_math(md_text)
    lines = text.split('\n')
    out   = []
    i     = 0
    in_code   = False
    code_buf  = []
    in_table  = False
    table_buf = []

    def flush_table():
        nonlocal in_table, table_buf
        if table_buf:
            out.append(make_table(table_buf))
        in_table  = False
        table_buf = []

    while i < len(lines):
        raw = lines[i]

        # ---- fenced code block -----------------------------------
        if raw.startswith('```'):
            if not in_code:
                if in_table:
                    flush_table()
                in_code  = True
                code_buf = []
            else:
                in_code = False
                # Don't escape code; just restore any math placeholders
                code = _restore('\n'.join(code_buf))
                out.append(r'\begin{lstlisting}')
                out.append(code)
                out.append(r'\end{lstlisting}')
                code_buf = []
            i += 1
            continue

        if in_code:
            code_buf.append(raw)
            i += 1
            continue

        # ---- table -----------------------------------------------
        is_tline = (raw.strip().startswith('|') and
                    '|' in raw.strip()[1:] and
                    raw.strip().endswith('|'))
        if is_tline:
            in_table = True
            table_buf.append(raw)
            i += 1
            continue
        elif in_table:
            flush_table()

        # ---- blank line ------------------------------------------
        if raw.strip() == '':
            out.append('')
            i += 1
            continue

        # ---- display-math placeholder on its own line -----------
        if re.match(r'^XMXMX\d+X$', raw.strip()):
            out.append(_restore(raw.strip()))
            i += 1
            continue

        # ---- horizontal rule ------------------------------------
        if re.match(r'^-{3,}$', raw.strip()) or re.match(r'^\*{3,}$', raw.strip()):
            out.append(r'\medskip\hrule\medskip')
            i += 1
            continue

        # ---- headings -------------------------------------------
        h = re.match(r'^(#{1,4})\s+(.*)', raw)
        if h:
            level = len(h.group(1))
            title = _restore(process_inline(h.group(2)))
            cmds  = {1: r'\chapter', 2: r'\section',
                     3: r'\subsection', 4: r'\subsubsection'}
            cmd = cmds.get(level, r'\paragraph')
            out.append('%s{%s}' % (cmd, title))
            i += 1
            continue

        # ---- blockquote / callout box ---------------------------
        if raw.startswith('>'):
            bq = []
            while i < len(lines) and lines[i].startswith('>'):
                bq.append(lines[i].lstrip('> '))
                i += 1
            first_line = bq[0] if bq else ''
            rest_lines = bq[1:]
            first_proc = _restore(process_inline(first_line))
            rest_proc  = '\n'.join(_restore(process_inline(l)) for l in rest_lines)
            is_box = any(first_line.startswith(kw) for kw in BOX_STARTERS)
            if is_box or first_line.startswith('**'):
                raw_title = re.sub(r'^\*\*|\*\*$', '', first_line).rstrip(':').strip()
                box_title = _restore(process_inline(raw_title))
                out.append(r'\begin{keybox}{' + box_title + '}')
                if rest_proc.strip():
                    out.append(rest_proc)
                out.append(r'\end{keybox}')
            else:
                combined = first_proc
                if rest_proc.strip():
                    combined += '\n\n' + rest_proc
                out.append(r'\begin{notebox}')
                out.append(combined)
                out.append(r'\end{notebox}')
            continue

        # ---- unordered list -------------------------------------
        if is_ulist(raw):
            out.append(r'\begin{itemize}')
            while i < len(lines) and is_ulist(lines[i]):
                item = _restore(process_inline(strip_marker(lines[i]).strip()))
                out.append(r'\item ' + item)
                i += 1
            out.append(r'\end{itemize}')
            continue

        # ---- ordered list ---------------------------------------
        if is_olist(raw):
            out.append(r'\begin{enumerate}')
            while i < len(lines) and is_olist(lines[i]):
                item = _restore(process_inline(strip_marker(lines[i]).strip()))
                out.append(r'\item ' + item)
                i += 1
            out.append(r'\end{enumerate}')
            continue

        # ---- plain paragraph ------------------------------------
        out.append(_restore(process_inline(raw)))
        i += 1

    if in_table:
        flush_table()

    return '\n'.join(out)


# ================================================================
#  CHAPTER MANIFEST
# ================================================================

CHAPTERS = [
    ('ECON621_Textbook_Chapter_01_Introduction.md',              'ch01_introduction'),
    ('ECON621_Textbook_Chapter_02_CEF_and_Regression.md',        'ch02_cef'),
    ('ECON621_Textbook_Chapter_03_OLS_Algebra_and_Geometry.md',  'ch03_ols_geometry'),
    ('ECON621_Textbook_Chapter_04_Statistical_Properties_OLS.md','ch04_finite_sample'),
    ('ECON621_Textbook_Chapter_05_Asymptotic_Robust_Inference.md','ch05_asymptotic'),
    ('ECON621_Textbook_Chapter_06_FWL_Omitted_Variable_Bias.md', 'ch06_fwl_ovb'),
    ('ECON621_Textbook_Chapter_07_Dummies_Interactions_Nonlinearities.md','ch07_dummies'),
    ('ECON621_Textbook_Chapter_08_Instrumental_Variables.md',    'ch08_iv'),
    ('ECON621_Textbook_Chapter_09_LATE.md',                      'ch09_late'),
    ('ECON621_Textbook_Chapter_10_Panel_Data.md',                'ch10_panel'),
    ('ECON621_Textbook_Chapter_11_Differences_in_Differences.md','ch11_did'),
    ('ECON621_Textbook_Chapter_12_Matching.md',                  'ch12_matching'),
    ('ECON621_Textbook_Chapter_13_Regression_Discontinuity.md',  'ch13_rdd'),
]


if __name__ == '__main__':
    base = pathlib.Path('/Volumes/MK1/Git Project/Teaching/2027/Winter2027/ECON621')
    chapters_dir = base / 'chapters'
    chapters_dir.mkdir(exist_ok=True)

    for num, (md_name, tex_stem) in enumerate(CHAPTERS, start=1):
        md_path  = base / md_name
        tex_path = chapters_dir / ('%s.tex' % tex_stem)
        print('[%02d/13] %s' % (num, md_name))
        with open(str(md_path), 'r', encoding='utf-8') as f:
            md = f.read()
        body = convert_chapter(md)
        with open(str(tex_path), 'w', encoding='utf-8') as f:
            f.write(body)

    print('\nDone.')
