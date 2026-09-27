#!/usr/bin/env python3
"""
ECON 230 — Introduction to Behavioural Economics
Single summary slide generator (16 × 9, dark theme, 4 × 3 topic grid).
"""
import os
from pptx import Presentation
from pptx.util import Inches, Pt
from pptx.dml.color import RGBColor
from pptx.enum.text import PP_ALIGN

# ── Presentation ──────────────────────────────────────────────────────────────
prs = Presentation()
prs.slide_width  = Inches(16)
prs.slide_height = Inches(9)
slide = prs.slides.add_slide(prs.slide_layouts[6])   # blank

# ── Palette ───────────────────────────────────────────────────────────────────
BG    = RGBColor( 10,  15,  35)
CARD  = RGBColor( 22,  32,  58)
WHITE = RGBColor(255, 255, 255)
MUTED = RGBColor(148, 163, 184)
HEAD  = RGBColor( 16,  24,  52)

ACC = [
    RGBColor( 56, 189, 248),   # sky-blue
    RGBColor(251, 191,  36),   # amber
    RGBColor( 52, 211, 153),   # emerald
    RGBColor(249, 115,  22),   # orange
    RGBColor(167, 139, 250),   # violet
    RGBColor(251, 113, 133),   # rose
    RGBColor( 34, 211, 238),   # cyan
    RGBColor(163, 230,  53),   # lime
    RGBColor(250, 204,  21),   # yellow
    RGBColor(192, 132, 252),   # purple
    RGBColor(251, 146,  60),   # light-orange
    RGBColor( 94, 234, 212),   # teal
]

ICN_BG = [
    RGBColor( 8, 42, 62),  RGBColor(52, 38,  8),
    RGBColor( 8, 46, 34),  RGBColor(52, 22,  5),
    RGBColor(35, 28, 60),  RGBColor(52, 22, 28),
    RGBColor( 8, 44, 50),  RGBColor(32, 50,  8),
    RGBColor(52, 44,  5),  RGBColor(38, 25, 56),
    RGBColor(52, 30,  8),  RGBColor( 8, 50, 44),
]

RECT  = 1   # MSO_AUTO_SHAPE_TYPE.RECTANGLE
RRECT = 5   # MSO_AUTO_SHAPE_TYPE.ROUNDED_RECTANGLE
OVAL  = 9   # MSO_AUTO_SHAPE_TYPE.OVAL


# ── Shape helpers ─────────────────────────────────────────────────────────────
def sh(kind, l, t, w, h, fill, border=None, bpt=1.2):
    s = slide.shapes.add_shape(kind,
                               Inches(l), Inches(t), Inches(w), Inches(h))
    s.fill.solid()
    s.fill.fore_color.rgb = fill
    if border:
        s.line.color.rgb = border
        s.line.width     = Pt(bpt)
    else:
        s.line.fill.background()
    return s


def tx(l, t, w, h, text, sz, bold=False, italic=False,
       color=WHITE, align=PP_ALIGN.CENTER):
    tb = slide.shapes.add_textbox(Inches(l), Inches(t), Inches(w), Inches(h))
    tf = tb.text_frame
    tf.word_wrap = True
    p  = tf.paragraphs[0]
    p.alignment  = align
    r  = p.add_run()
    r.text           = text
    r.font.size      = Pt(sz)
    r.font.bold      = bold
    r.font.italic    = italic
    r.font.color.rgb = color
    return tb


# ── Background + header ───────────────────────────────────────────────────────
sh(RECT, 0, 0, 16, 9,    BG)
sh(RECT, 0, 0, 16, 1.30, HEAD)
sh(RECT, 0, 0, 16, 0.06, ACC[0])          # sky-blue top stripe

# Course badge
sh(RRECT, 0.28, 0.21, 1.72, 0.46, ACC[0])
tx(0.28, 0.21, 1.72, 0.46, "ECON 230", 13,
   bold=True, color=RGBColor(10, 15, 35))

# Header title + subtitle
tx(2.18, 0.07, 11.2, 0.60,
   "Introduction to Behavioural Economics",
   27, bold=True, color=WHITE, align=PP_ALIGN.LEFT)
tx(2.18, 0.67, 11.8, 0.42,
   "How psychology, cognition, and social context shape real-world economic decisions",
   11, italic=True, color=MUTED, align=PP_ALIGN.LEFT)

# Decorative overlapping circles (brain motif, top-right)
for ox, oy, r, c in [
    (14.70, 0.68, 0.27, ACC[0]),   # sky-blue
    (15.18, 0.68, 0.27, ACC[4]),   # violet
    (14.94, 0.37, 0.22, ACC[2]),   # emerald
]:
    sh(OVAL, ox - r, oy - r, r * 2, r * 2, c)

# "vs" pill — Econs vs Humans (header right label)
sh(RRECT, 13.60, 0.25, 1.10, 0.36, RGBColor(30, 42, 68))
tx(13.60, 0.25, 1.10, 0.36, "Econs vs Humans", 7,
   italic=True, color=MUTED)

# ── Topic data ────────────────────────────────────────────────────────────────
topics = [
    ("🧠", "Bounded Rationality",
     "Quick heuristics replace full optimization — we satisfice rather than maximize"),
    ("📉", "Loss Aversion",
     "Losses feel ~2× more painful than equivalent gains feel rewarding (Kahneman & Tversky)"),
    ("⚓", "Anchoring Bias",
     "The first number we see biases every subsequent estimate and negotiation"),
    ("👆", "Nudge Theory",
     "Default settings & choice architecture predictably guide behaviour at scale"),
    ("⏰", "Present Bias",
     "Immediate rewards are over-weighted vs. larger future payoffs (β-δ discounting)"),
    ("🎯", "Overconfidence",
     "Systematic over-estimation of own abilities, accuracy, and predictions"),
    ("🖼", "Framing Effects",
     "Identical options presented differently produce different decisions"),
    ("💰", "Mental Accounting",
     "Money is sorted into mental 'buckets' and treated inconsistently across them"),
    ("🤝", "Social Preferences",
     "Fairness, reciprocity & altruism drive choices beyond pure self-interest"),
    ("🔄", "Status Quo Bias",
     "The current state feels safe — deviation requires justification (default stickiness)"),
    ("💸", "Sunk Cost Fallacy",
     "Past unrecoverable costs irrationally influence future decisions ('throwing good after bad')"),
    ("🏆", "Endowment Effect",
     "Ownership alone inflates perceived value: willingness-to-accept exceeds willingness-to-pay"),
]

# Relative bar heights for the mini-chart decoration (3 bars, 0–1 scale)
BARS = [
    [0.35, 0.20, 0.50],   # Bounded Rationality — satisficing threshold
    [0.55, 0.18, 0.18],   # Loss Aversion — asymmetric
    [0.45, 0.30, 0.55],   # Anchoring — upward estimate shift
    [0.30, 0.55, 0.40],   # Nudge — middle option dominates
    [0.58, 0.35, 0.18],   # Present Bias — declining over time
    [0.40, 0.50, 0.60],   # Overconfidence — rising estimates
    [0.50, 0.28, 0.50],   # Framing — symmetric mirror
    [0.32, 0.55, 0.25],   # Mental Accounting — uneven buckets
    [0.38, 0.42, 0.45],   # Social Preferences — near-equal sharing
    [0.55, 0.55, 0.52],   # Status Quo — flat resistance
    [0.55, 0.40, 0.25],   # Sunk Cost — declining return
    [0.22, 0.45, 0.60],   # Endowment Effect — value rises with ownership
]

# ── Card grid ─────────────────────────────────────────────────────────────────
COLS, ROWS   = 4, 3
L_MAR, T_TOP = 0.22, 1.38
H_GAP, V_GAP = 0.18, 0.16

CARD_W = (16 - 2 * L_MAR - (COLS - 1) * H_GAP) / COLS   # ≈ 3.755 in
CARD_H = (9  - T_TOP - 0.12 - (ROWS - 1) * V_GAP) / ROWS  # ≈ 2.387 in

for i, (emoji, title, desc) in enumerate(topics):
    col = i % COLS
    row = i // COLS
    cx  = L_MAR + col * (CARD_W + H_GAP)
    cy  = T_TOP + row  * (CARD_H + V_GAP)
    ac  = ACC[i]
    ib  = ICN_BG[i]

    # Card background
    sh(RRECT, cx, cy, CARD_W, CARD_H, CARD)
    # Thin colored top bar
    sh(RECT,  cx, cy, CARD_W, 0.065, ac)

    # Emoji icon circle
    r  = 0.26
    ex = cx + CARD_W / 2 - r
    ey = cy + 0.13
    sh(OVAL, ex, ey, r * 2, r * 2, ib, border=ac, bpt=1.5)
    tx(ex - 0.02, ey + 0.01, r * 2 + 0.04, r * 2, emoji, 14)

    # Title
    ty = ey + r * 2 + 0.07
    tx(cx + 0.06, ty, CARD_W - 0.12, 0.35, title,
       11.5, bold=True, color=ac)

    # Thin divider
    dv_y = ty + 0.36
    sh(RECT, cx + 0.10, dv_y, CARD_W - 0.20, 0.011, RGBColor(38, 52, 82))

    # Description
    ds_y = dv_y + 0.06
    ds_h = CARD_H - (ds_y - cy) - 0.44
    tx(cx + 0.09, ds_y, CARD_W - 0.18, ds_h, desc, 8.2, color=MUTED)

    # Mini bar chart (bottom decoration)
    bw, bg_ = 0.11, 0.038
    tot_w   = 3 * bw + 2 * bg_
    bx0     = cx + (CARD_W - tot_w) / 2
    max_bh  = 0.26
    base_y  = cy + CARD_H - 0.07
    for j, frac in enumerate(BARS[i]):
        bh  = frac * max_bh
        bxj = bx0 + j * (bw + bg_)
        sh(RRECT, bxj, base_y - bh, bw, bh, ac)

# ── Footer ────────────────────────────────────────────────────────────────────
sh(RECT, 0, 8.82, 16, 0.018, RGBColor(36, 50, 78))
tx(0.28, 8.73, 9.5, 0.25,
   "Economics × Psychology  →  Understanding Predictable Irrationality",
   9, italic=True, color=MUTED, align=PP_ALIGN.LEFT)
tx(10.0, 8.73, 5.7, 0.25,
   "Kahneman  ·  Thaler  ·  Ariely  ·  Sunstein  ·  Loewenstein",
   9, italic=True, color=MUTED, align=PP_ALIGN.RIGHT)

# ── Save ──────────────────────────────────────────────────────────────────────
out_dir  = "/Volumes/MK1/Git Project/Teaching/2026/Fall2026/ECON230/Slides"
out_path = os.path.join(out_dir, "ECON230_Overview_Slide.pptx")
os.makedirs(out_dir, exist_ok=True)
prs.save(out_path)
print(f"Saved  ->  {out_path}")
