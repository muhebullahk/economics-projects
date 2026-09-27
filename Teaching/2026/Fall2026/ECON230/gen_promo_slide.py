#!/usr/bin/env python3
"""
ECON 230 — Promotional Overview Slide  (UNBC light theme)
Each of the 12 topic cards contains a unique hand-drawn diagram.
"""
import os
from pptx import Presentation
from pptx.util import Inches, Pt
from pptx.dml.color import RGBColor
from pptx.enum.text import PP_ALIGN

prs = Presentation()
prs.slide_width  = Inches(16)
prs.slide_height = Inches(9)
slide = prs.slides.add_slide(prs.slide_layouts[6])

# ── UNBC palette ──────────────────────────────────────────────────────────────
G   = RGBColor(  0,  87,  63)   # UNBC forest green
AU  = RGBColor(245, 168,   0)   # UNBC gold
LG  = RGBColor(232, 245, 238)   # light green bg
WH  = RGBColor(255, 255, 255)
OFF = RGBColor(248, 250, 251)   # off-white slide bg
TXD = RGBColor( 18,  30,  28)   # dark text
TXM = RGBColor( 70,  90,  80)   # medium text
TXL = RGBColor(145, 165, 155)   # light text

# 12 accent colours, one per topic
AC = [
    RGBColor(  0, 145, 100),  # emerald      0 Bounded Rationality
    RGBColor(210,  45,  45),  # red          1 Loss Aversion
    RGBColor( 30,  95, 195),  # blue         2 Anchoring
    RGBColor(  0, 165,  80),  # green        3 Nudge Theory
    RGBColor(200,  95,   0),  # orange       4 Present Bias
    RGBColor(140,  45, 190),  # purple       5 Overconfidence
    RGBColor( 15, 145, 175),  # teal         6 Framing
    RGBColor(165, 125,   0),  # dark gold    7 Mental Accounting
    RGBColor( 40, 125,  40),  # forest       8 Social Preferences
    RGBColor(175,  65,  15),  # burnt orange 9 Status Quo
    RGBColor( 25,  75, 155),  # navy        10 Sunk Cost
    RGBColor(155,  35, 115),  # magenta     11 Endowment
]

# Light tint per topic (card diagram bg)
AT = [
    RGBColor(232, 252, 243), RGBColor(255, 238, 238),
    RGBColor(233, 242, 255), RGBColor(233, 252, 242),
    RGBColor(255, 243, 228), RGBColor(247, 236, 255),
    RGBColor(230, 248, 252), RGBColor(255, 249, 222),
    RGBColor(236, 248, 236), RGBColor(255, 240, 230),
    RGBColor(230, 239, 255), RGBColor(252, 233, 247),
]

RECT, RRECT, OVAL = 1, 5, 9


def sh(kind, l, t, w, h, fill, border=None, bpt=1.0):
    s = slide.shapes.add_shape(kind, Inches(l), Inches(t), Inches(w), Inches(h))
    s.fill.solid(); s.fill.fore_color.rgb = fill
    if border:
        s.line.color.rgb = border; s.line.width = Pt(bpt)
    else:
        s.line.fill.background()
    return s


def tx(l, t, w, h, text, sz, bold=False, italic=False,
       color=TXD, align=PP_ALIGN.CENTER):
    tb = slide.shapes.add_textbox(Inches(l), Inches(t), Inches(w), Inches(h))
    tf = tb.text_frame; tf.word_wrap = True
    p  = tf.paragraphs[0]; p.alignment = align
    r  = p.add_run()
    r.text = text; r.font.size = Pt(sz)
    r.font.bold = bold; r.font.italic = italic
    r.font.color.rgb = color
    return tb


# ── Slide background ──────────────────────────────────────────────────────────
sh(RECT, 0, 0, 16, 9, OFF)

# ── Header (UNBC green band) ──────────────────────────────────────────────────
sh(RECT, 0, 0, 16, 1.55, G)
# Subtle lighter stripe at very top
sh(RECT, 0, 0, 16, 0.055, RGBColor(0, 120, 88))

# UNBC crest simulation
sh(OVAL,  0.15, 0.14, 0.56, 0.56, RGBColor(0, 68, 48))
sh(OVAL,  0.23, 0.22, 0.40, 0.40, AU)
tx(0.20,  0.20, 0.46, 0.42, "UNBC", 8, bold=True, color=G)

# Course badge
sh(RRECT, 0.88, 0.24, 1.52, 0.38, AU)
tx(0.90,  0.24, 1.50, 0.38, "ECON 230", 12, bold=True, color=G, align=PP_ALIGN.LEFT)

# Main title
tx(2.56, 0.06, 10.8, 0.60,
   "Introduction to Behavioural Economics",
   28, bold=True, color=WH, align=PP_ALIGN.LEFT)
tx(2.56, 0.67, 10.8, 0.44,
   "Discover why smart, educated people still make predictably irrational choices — and how to change them",
   11, italic=True, color=RGBColor(195, 232, 215), align=PP_ALIGN.LEFT)

# Right badges
sh(RRECT, 13.52, 0.17, 2.24, 0.36, RGBColor(0, 112, 80))
tx(13.52,  0.17, 2.24, 0.36, "★  Student Favourite", 9, bold=True, color=AU)
sh(RRECT, 13.52, 0.60, 2.24, 0.36, RGBColor(0, 112, 80))
tx(13.52,  0.60, 2.24, 0.36, "No Prerequisites", 9, bold=True, color=WH)

# ── Gold info banner ──────────────────────────────────────────────────────────
sh(RECT, 0, 1.55, 16, 0.40, AU)
tx(0.4, 1.58, 15.2, 0.34,
   "✦  Open to ALL Programs   ✦   No Economics Background Needed   ✦   3 Credit Hours   ✦   Fall 2026   ✦",
   10, bold=True, color=G)

# ── Card grid constants ───────────────────────────────────────────────────────
COLS, ROWS   = 4, 3
LM,   TT     = 0.22, 2.06
HG,   VG     = 0.17, 0.14
CW = (16 - 2*LM - (COLS-1)*HG) / COLS   # ≈ 3.735
CH = (9  - TT - 0.12 - (ROWS-1)*VG) / ROWS  # ≈ 2.237

topics = [
    ("Bounded Rationality",   "We satisfice — quick enough beats perfectly optimal"),
    ("Loss Aversion",         "Losses sting ~2× more than equal gains feel good"),
    ("Anchoring Bias",        "The first number heard skews every estimate after"),
    ("Nudge Theory",          "Tiny default tweaks guide millions of decisions"),
    ("Present Bias",          "A reward now beats a bigger reward tomorrow"),
    ("Overconfidence",        "Most drivers — and students — think they're above average"),
    ("Framing Effects",       "90% Fat-Free vs 10% Fat — same product, different choice"),
    ("Mental Accounting",     "We budget 'fun money' differently from 'rent money'"),
    ("Social Preferences",    "Fairness, reciprocity & altruism trump pure self-interest"),
    ("Status Quo Bias",       "Whatever is default tends to stay — inertia is powerful"),
    ("Sunk Cost Fallacy",     "Past losses keep us investing in failing projects"),
    ("Endowment Effect",      "We price things higher the moment we own them"),
]

for i, (title, tagline) in enumerate(topics):
    col = i % COLS;  row = i // COLS
    cx  = LM + col*(CW+HG);  cy = TT + row*(CH+VG)
    ac  = AC[i];              at  = AT[i]

    # Card shell
    sh(RRECT, cx, cy, CW, CH, WH, border=RGBColor(220,228,224), bpt=0.6)
    # Coloured left accent bar
    sh(RECT,  cx, cy, 0.07, CH, ac)
    # Coloured top accent bar
    sh(RECT,  cx, cy, CW, 0.055, ac)

    # ── Diagram area ─────────────────────────────────────────────────────────
    DX = cx + 0.12          # diagram left
    DY = cy + 0.10          # diagram top
    DW = CW  - 0.22         # ≈ 3.515
    DH = 1.02               # diagram height
    sh(RRECT, DX, DY, DW, DH, at)  # tinted bg

    # ── Per-topic graphic ─────────────────────────────────────────────────────

    if i == 0:   # Bounded Rationality — brain + satisficing line
        sh(OVAL, DX+0.20, DY+0.10, 0.72, 0.56, RGBColor(180,232,210), border=ac, bpt=1.2)
        sh(OVAL, DX+0.76, DY+0.10, 0.68, 0.56, RGBColor(180,232,210), border=ac, bpt=1.2)
        # Threshold line
        sh(RECT, DX+0.12, DY+0.73, DW-0.24, 0.035, ac)
        tx(DX+0.12, DY+0.76, 1.30, 0.22, "✓ Good Enough", 7.5, bold=True, color=ac, align=PP_ALIGN.LEFT)
        tx(DX+1.55, DY+0.76, 1.70, 0.22, "✗ Optimal (skipped)", 7.5, italic=True, color=RGBColor(180,60,60), align=PP_ALIGN.LEFT)

    elif i == 1:  # Loss Aversion — asymmetric bar chart
        base = DY + DH - 0.06
        # Loss bar (tall, red)
        sh(RRECT, DX+0.30, base-0.72, 0.56, 0.72, RGBColor(215,55,55))
        tx(DX+0.25, base-0.86, 0.66, 0.20, "−$100", 8, bold=True, color=RGBColor(170,30,30))
        tx(DX+0.26, base+0.01, 0.64, 0.18, "Loss", 7.5, color=TXM)
        # Gain bar (short, green)
        sh(RRECT, DX+1.20, base-0.38, 0.56, 0.38, RGBColor(45,180,95))
        tx(DX+1.15, base-0.52, 0.66, 0.20, "+$100", 8, bold=True, color=RGBColor(20,130,55))
        tx(DX+1.16, base+0.01, 0.64, 0.18, "Gain", 7.5, color=TXM)
        # "2× pain" label
        tx(DX+2.10, base-0.68, 1.20, 0.74, "Pain\n= 2×\nJoy", 8.5, bold=True, color=ac)
        # Axis
        sh(RECT, DX+0.14, base, DW-0.28, 0.025, TXL)

    elif i == 2:  # Anchoring — anchor icon + two diverging estimates
        sh(OVAL, DX+0.20, DY+0.10, 0.50, 0.50, at, border=ac, bpt=1.5)
        tx(DX+0.20, DY+0.10, 0.50, 0.50, "⚓", 20, color=ac)
        sh(RRECT, DX+0.96, DY+0.10, 0.90, 0.34, RGBColor(220,235,255), border=RGBColor(30,95,195), bpt=0.8)
        tx(DX+0.96, DY+0.10, 0.90, 0.34, "Est:  900 ?", 9, bold=True, color=RGBColor(30,95,195))
        sh(RRECT, DX+0.96, DY+0.58, 0.90, 0.34, RGBColor(255,248,220), border=RGBColor(160,120,0), bpt=0.8)
        tx(DX+0.96, DY+0.58, 0.90, 0.34, "Est:  200 ?", 9, bold=True, color=RGBColor(150,100,0))
        # vertical arrow between estimates
        sh(RECT, DX+1.38, DY+0.44, 0.035, 0.15, TXL)
        tx(DX+1.96, DY+0.38, 1.30, 0.30, "← anchor\n   bias", 7.5, italic=True, color=TXL, align=PP_ALIGN.LEFT)

    elif i == 3:  # Nudge Theory — checkbox list, 1st option highlighted
        labels = ["☑  Organ Donor  ← DEFAULT", "○  Not a Donor", "○  Other…"]
        clrs   = [at, WH, WH]
        bclrs  = [ac, RGBColor(210,210,210), RGBColor(210,210,210)]
        for j, (lbl, bg_, bc) in enumerate(zip(labels, clrs, bclrs)):
            ry = DY + 0.07 + j*0.30
            sh(RRECT, DX+0.10, ry, DW-0.20, 0.26, bg_, border=bc, bpt=0.8 if j==0 else 0.4)
            tx(DX+0.16, ry+0.03, DW-0.34, 0.20, lbl,
               9 if j==0 else 8.5, bold=(j==0),
               color=ac if j==0 else TXL, align=PP_ALIGN.LEFT)

    elif i == 4:  # Present Bias — big NOW circle, small LATER circle + timeline
        # Timeline axis
        sh(RECT, DX+0.18, DY+0.56, DW-0.36, 0.030, TXL)
        # NOW circle (large, gold)
        sh(OVAL, DX+0.18, DY+0.08, 0.76, 0.76, AU, border=RGBColor(190,125,0), bpt=1.2)
        tx(DX+0.18, DY+0.08, 0.76, 0.76, "NOW\n$10", 8.5, bold=True, color=G)
        # LATER circle (small, grey)
        sh(OVAL, DX+1.50, DY+0.36, 0.42, 0.42, RGBColor(215,215,215), border=TXL, bpt=0.8)
        tx(DX+1.50, DY+0.36, 0.42, 0.42, "$15\nlater", 7, color=TXM)
        # Comment
        tx(DX+2.10, DY+0.20, 1.20, 0.60, "Most choose\n$10 now\nover $15\nnext week", 7.5, italic=True, color=TXM, align=PP_ALIGN.LEFT)

    elif i == 5:  # Overconfidence — horizontal gauge + needle
        # Gauge track
        sh(RRECT, DX+0.18, DY+0.32, DW-0.36, 0.34, RGBColor(235,235,235))
        segs = [(RGBColor(45,180,80),"Low"),(AU,"Medium"),(RGBColor(215,55,55),"HIGH!")]
        sw = (DW-0.44)/3
        for j,(c,lbl) in enumerate(segs):
            sx = DX+0.22 + j*sw
            sh(RRECT, sx, DY+0.34, sw-0.04, 0.30, c)
            tx(sx, DY+0.34, sw-0.04, 0.30, lbl, 7.5, bold=(j==2),
               color=WH if j!=1 else G)
        # Needle (pointer) at right end
        sh(RECT, DX+DW-0.40, DY+0.18, 0.045, 0.50, ac)
        sh(OVAL, DX+DW-0.42, DY+0.14, 0.082, 0.082, ac)
        tx(DX+0.14, DY+0.70, DW-0.28, 0.22,
           "Most people estimate their ability here ↑", 7.5, italic=True, color=ac)

    elif i == 6:  # Framing Effects — two identical glasses, different label
        for j,(lbl,bg_,bc,tc) in enumerate([
            ("90%\nFAT FREE\n😊", RGBColor(225,248,235), ac, ac),
            ("10%\nFAT\n😟", RGBColor(255,232,232), RGBColor(200,50,50), RGBColor(180,30,30)),
        ]):
            bx = DX + 0.18 + j*1.62
            sh(RRECT, bx, DY+0.08, 1.02, 0.80, bg_, border=bc, bpt=1.0)
            tx(bx, DY+0.08, 1.02, 0.80, lbl, 9, bold=True, color=tc)
        tx(DX+1.28, DY+0.28, 0.60, 0.48, "←\nSAME\n→", 8, bold=True, color=TXL)

    elif i == 7:  # Mental Accounting — three jars with different fill levels
        jars = [("Rent", 0.88, G), ("Fun", 0.42, AU), ("Savings", 0.28, AC[7])]
        jw, jspace = 0.72, 0.28
        for j,(lbl,frac,c) in enumerate(jars):
            jx = DX + 0.14 + j*(jw+jspace)
            jh = 0.76
            sh(RRECT, jx, DY+0.08, jw, jh, RGBColor(238,238,238), border=RGBColor(180,180,180), bpt=0.5)
            fh = frac*(jh-0.06)
            sh(RRECT, jx+0.03, DY+0.08+jh-fh-0.03, jw-0.06, fh, c)
            tx(jx, DY+0.86, jw, 0.18, lbl, 8, bold=True, color=TXM)

    elif i == 8:  # Social Preferences — two stick figures + $ between
        # Figure A
        sh(OVAL,  DX+0.20, DY+0.06, 0.40, 0.40, ac)
        sh(RECT,  DX+0.29, DY+0.46, 0.22, 0.40, ac)
        sh(RECT,  DX+0.13, DY+0.50, 0.18, 0.08, ac)   # left arm
        sh(RECT,  DX+0.49, DY+0.50, 0.18, 0.08, ac)   # right arm
        tx(DX+0.08, DY+0.88, 0.64, 0.18, "Person A", 7.5, color=TXM)
        # Figure B
        sh(OVAL,  DX+2.60, DY+0.06, 0.40, 0.40, RGBColor(50,140,200))
        sh(RECT,  DX+2.69, DY+0.46, 0.22, 0.40, RGBColor(50,140,200))
        sh(RECT,  DX+2.53, DY+0.50, 0.18, 0.08, RGBColor(50,140,200))
        sh(RECT,  DX+2.89, DY+0.50, 0.18, 0.08, RGBColor(50,140,200))
        tx(DX+2.48, DY+0.88, 0.64, 0.18, "Person B", 7.5, color=TXM)
        # Dollar box
        sh(RRECT, DX+1.22, DY+0.18, 1.00, 0.52, RGBColor(255,249,215), border=AU, bpt=1.0)
        tx(DX+1.22, DY+0.18, 1.00, 0.52, "$100\nFair\nSplit?", 8, bold=True, color=G)
        # Arrows
        sh(RECT, DX+0.77, DY+0.42, 0.47, 0.035, AU)
        sh(RECT, DX+2.20, DY+0.42, 0.45, 0.035, AU)

    elif i == 9:  # Status Quo Bias — STAY vs CHANGE
        # STAY (central, bold)
        sh(RRECT, DX+1.10, DY+0.12, 1.32, 0.72, RGBColor(232,248,238), border=G, bpt=1.2)
        tx(DX+1.10, DY+0.12, 1.32, 0.72, "✓  STAY\n(Default)", 10, bold=True, color=G)
        # CHANGE options (faded)
        sh(RRECT, DX+0.10, DY+0.30, 0.85, 0.38, RGBColor(245,245,245), border=RGBColor(200,200,200), bpt=0.4)
        tx(DX+0.10, DY+0.30, 0.85, 0.38, "Change?", 8.5, italic=True, color=RGBColor(185,185,185))
        sh(RRECT, DX+2.58, DY+0.30, 0.85, 0.38, RGBColor(245,245,245), border=RGBColor(200,200,200), bpt=0.4)
        tx(DX+2.58, DY+0.30, 0.85, 0.38, "Switch?", 8.5, italic=True, color=RGBColor(185,185,185))
        # Arrows pointing away from STAY
        sh(RECT, DX+0.95, DY+0.46, 0.17, 0.035, TXL)
        sh(RECT, DX+2.42, DY+0.46, 0.17, 0.035, TXL)
        tx(DX+0.50, DY+0.78, DW-1.0, 0.18, "Inertia keeps us rooted", 7.5, italic=True, color=TXL)

    elif i == 10:  # Sunk Cost Fallacy — declining bar chart
        base = DY + DH - 0.07
        vals = [0.82, 0.66, 0.50, 0.34, 0.18]
        bw   = 0.44
        for j, v in enumerate(vals):
            bh = v * 0.74
            bx = DX + 0.18 + j*(bw+0.10)
            r_ = int(25 + j*40); gb = int(95 - j*15)
            sh(RRECT, bx, base-bh, bw, bh, RGBColor(r_, gb, 200-j*35))
        # "Sunk" overlay on first 3 bars
        sh(RECT, DX+0.18, DY+0.10, (bw+0.10)*3-0.10, 0.025, RGBColor(200,55,55))
        tx(DX+0.18, DY+0.12, (bw+0.10)*3-0.10, 0.22, "✕  Already Spent", 7.5, bold=True, color=RGBColor(185,45,45))
        sh(RECT, DX+0.18, base, (bw+0.10)*len(vals)-0.10, 0.025, TXL)

    elif i == 11:  # Endowment Effect — two price tags
        sh(RRECT, DX+0.15, DY+0.14, 1.22, 0.64, RGBColor(240,240,255), border=RGBColor(100,100,200), bpt=0.8)
        tx(DX+0.15, DY+0.14, 1.22, 0.64, "Before owning\nWilling to\nPAY:  $5", 8, bold=False, color=RGBColor(75,75,185))
        # Arrow
        tx(DX+1.45, DY+0.32, 0.62, 0.32, "Own\n  →", 10, bold=True, color=ac)
        sh(RRECT, DX+2.12, DY+0.14, 1.22, 0.64, RGBColor(250,235,255), border=ac, bpt=1.0)
        tx(DX+2.12, DY+0.14, 1.22, 0.64, "After owning\nWilling to\nSELL: $12", 8, bold=True, color=ac)
        tx(DX+0.15, DY+0.82, DW-0.30, 0.18, "WTA  >  WTP  — ownership inflates value", 7.5, italic=True, color=TXL)

    # ── Card title + tagline ──────────────────────────────────────────────────
    TY = DY + DH + 0.07
    tx(cx+0.14, TY, CW-0.20, 0.30, title, 11, bold=True, color=ac, align=PP_ALIGN.LEFT)
    tx(cx+0.14, TY+0.29, CW-0.20, CH-(TY+0.29-cy)-0.06,
       tagline, 8.2, italic=True, color=TXM, align=PP_ALIGN.LEFT)

# ── Footer ────────────────────────────────────────────────────────────────────
sh(RECT, 0, 8.68, 16, 0.32, G)
tx(0.40, 8.71, 8.5, 0.26,
   "Register at  my.unbc.ca  |  Questions?  economics@unbc.ca", 9, color=WH, align=PP_ALIGN.LEFT)
tx(9.80, 8.71, 5.8, 0.26,
   "Kahneman  ·  Thaler  ·  Ariely  ·  Sunstein  ·  Loewenstein",
   9, italic=True, color=RGBColor(180,220,200), align=PP_ALIGN.RIGHT)

# ── Save ──────────────────────────────────────────────────────────────────────
out = "/Volumes/MK1/Git Project/Teaching/2026/Fall2026/ECON230/Slides/ECON230_Overview_Slide.pptx"
os.makedirs(os.path.dirname(out), exist_ok=True)
prs.save(out)
print(f"Saved  ->  {out}")
