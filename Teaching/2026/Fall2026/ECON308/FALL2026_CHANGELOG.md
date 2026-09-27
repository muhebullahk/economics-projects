# ECON 308 Fall 2026 — Lecture Redesign Changelog

**Course:** ECON 308 International Economic Relations  
**Instructor:** Muhebullah Karimzada  
**Institution:** University of Northern British Columbia  
**Redesign date:** September 2026  
**Textbook:** Krugman, Obstfeld & Melitz, *International Economics: Theory and Policy*, 12th ed.

---

## Course-Wide Design Principles (Applied to All Lectures)

### Pedagogical Framework
Every lecture follows the **Q → I → M → D → ℰ → CA → MC → P** sequence where applicable:
- **Q** = Opening question / motivating puzzle
- **I** = Economic intuition (plain language)
- **M** = Formal model (equations, notation)
- **D** = Diagram (TikZ or extracted PNG figure)
- **ℰ** = Worked example (numerical)
- **CA** = Canadian application
- **MC** = Macroeconomic connection
- **P** = Policy implication / takeaway

### Three-Level Explanation Standard
All major models are explained at:
1. **Intuition level** — plain economic language
2. **Graphical level** — diagram with labeled axes
3. **Formal level** — equations with all variables defined

### Macro-Trade Connection Framework
Where economically relevant, lectures explicitly trace:
> International Shock → Trade Channel → Domestic Price/Quantity Effect → Employment/Output Effect → Macro Policy Response

### Canadian Application Standard
Each lecture contains at least two substantive Canadian examples using the `canadex` box environment.

### Slide Types
- **Core slides**: must-teach material, always in the deck
- **[OPT]** tagged slides: extension/enrichment, use if time permits

---

## Fall 2025 Course Audit Summary

| File | Slides | Chapter | Topics |
|------|--------|---------|--------|
| Lecture 1 (Ch.2).pptx | 31 | World Trade Overview | Gravity model, borders, globalization, composition |
| Lecture 2 (Ch.3 Part 1).pptx | 28 | Ricardian (Part 1) | Comparative advantage concept, PPF, relative prices |
| Lecture 2 (Ch.3).pptx | 81 | Ricardian (Full) | Full Ricardian model + relative wages + empirics |
| Lecture 3 (Ch.3 Part 2).pptx | 38 | Ricardian (Part 2) | Trade, gains, wages, empirics |
| Lecture 5 (Ch.4 Part 1).pptx | 32 | Specific Factors (Part 1) | Model, production, labour allocation |
| Lecture 5 (Ch.4).pptx | 71 | Specific Factors (Full) | Full SF model + trade + politics + labour mobility |
| Lecture 7 (Ch.4 Part 2).pptx | 38 | Specific Factors (Part 2) | Trade, politics, unemployment, immigration |
| Lecture 7 (Ch.5).pptx | 56 | Heckscher-Ohlin | H-O, SS, FPE, Rybczynski, inequality |
| Lectures on Ch.6.pptx | 52 | Standard Trade Model | Standard model, ToT, growth, tariffs, borrowing |
| Lectures on Ch.7.pptx | 29 | External Economies | EoS, market structure, external economies, clusters |
| Lectures on Ch.9.pptx | 56 | Trade Policy | Tariffs, quotas, subsidies, VERs |

**Total F25 slides: ~512 across 8 chapters**

### Key Gaps Identified in Fall 2025

1. **No macroeconomic framing**: Trade theory taught in isolation from GDP, employment, monetary policy, exchange rates.
2. **US-centric examples**: Almost no Canadian data, Canadian policy examples, or Canadian institutional context.
3. **No exchange rate discussion**: CAD/USD not mentioned despite being central to Canadian trade competitiveness.
4. **No balance-of-payments connection**: Trade balances, current account, capital flows — absent.
5. **No business-cycle framing**: How trade shocks transmit to Canadian output and employment — absent.
6. **Mechanical textbook flow**: Slides reproduce textbook paragraphs verbatim; no professor-led narrative arc.
7. **Missing policy context**: CUSMA/USMCA, CPTPP, CETA — barely mentioned.
8. **No active-learning design**: No structured discussion questions embedded in lecture.
9. **Dense slide text**: Many slides are text-heavy without visual relief.
10. **Missing variable definitions**: Some equations appear without all variables being defined.

---

## Fall 2026 Redesign Log

---

### Lec1 — World Trade: An Overview (Chapter 2)

**Status:** ✅ Redesigned  
**F25 slides:** 31  
**F26 slides:** 38  
**Estimated lecture time:** 2.5 hours

#### Content Changes

**Retained from F25:**
- All 6 PNG figures (Figs 2.1–2.6, 2.8) with enhanced explanations
- Table 2.1 (BC trade partners) — reformatted with adjustbox
- Table 2.2 (manufactured goods %) — reformatted
- Gravity model (3 slides F25 → 4 slides F26: added structural gravity)
- Globalization waves
- Composition of trade
- Service offshoring

**Expanded:**
- Gravity anomalies: added Ireland/Netherlands/Belgium explanation with institutional reasons
- Border effects: added Table 2.1 with BC data prominently
- Distance and borders: 4 slides → 6 slides; added 5 channels of distance cost

**New slides added:**
1. **Opening framing**: "Why Trade Matters for Canada's Economy" — Canada exports 32% of GDP; USD/CAD dependence; resource export share
2. **Course orientation**: "The Trade–Macro Nexus" — explicit diagram showing trade → prices → output → employment → monetary policy chain
3. **Trade as Aggregate Demand**: $Y = C + I + G + (X - M)$; Canada's (X-M)/GDP; sensitivity to US demand
4. **The Canada-US Relationship**: CUSMA, $700B bilateral trade, sector breakdown
5. **When the US Sneezes**: US recession → Canadian export shock → ΔY → Bank of Canada response (flow chart)
6. **Exchange Rate Preview**: Brief framing of how CAD/USD affects export competitiveness — deferred to future courses but context set
7. **Discussion frame**: "Trade Diversification: Should Canada reduce US dependence?"

#### Pedagogical Improvements
- Teaching arc: Canadian macro framing (why it matters) → trade facts → gravity model → barriers → globalization history → composition → macro implications
- Three-level explanation applied to gravity model: intuition → $T_{ij} = A \cdot Y_i^\alpha Y_j^\beta / D_{ij}^\gamma$ → structural gravity (GE effects)
- Active learning: discussion prompt on Canada-US dependence at end

#### Visual/Layout Fixes
- All PNG figures: `width=\textwidth, height=0.68\textheight, keepaspectratio` — verified fit
- Tables: `\begin{adjustbox}{max width=\textwidth}` wrapping
- Two-column layouts: `\begin{columns}[T]` for top-alignment
- `\small` applied to text-heavy columns
- `varbox` used for all variable definitions
- `canadex`, `insight`, `discuss` boxes for visual hierarchy

#### Macro Connections Added
- Trade as component of aggregate demand (Y = C + I + G + NX)
- Trade shocks → GDP → unemployment → Bank of Canada response
- Exchange rate: brief framing (deferred to full treatment in macro courses)
- Commodity prices → terms of trade → real income (Canada-specific)

#### Canadian Applications Added
- Canada's trade openness (32% of GDP)
- Canada-US \$700B bilateral trade vs. EU27
- BC lumber export geography (US vs. Asia)
- BC-Ontario trade vs. BC-Washington trade (McCallum border effect)
- Canada in the first wave of globalisation (CPR, Prairie wheat)
- Canada's dual resource-industrial trade structure
- Canada's service trade: net importer of IT, net exporter of finance

---

### Ch3 — Ricardian Model (Chapter 3)

**Status:** ✅ Redesigned  
**F25 slides:** 81 (overloaded; textbook paragraphs verbatim; US-centric)  
**F26 slides:** 30  
**Estimated lecture time:** ~2 hours  
**File:** `Slides/Ch3/Ch3.tex` → `Ch3.pdf`  
**Compile:** 0 errors, 0 overfull hboxes

#### Slide structure (30 slides)
1. Title
2. Opening Puzzle: Bangladesh vs. Canada
3. Where We Are in the Course (TikZ model-chain diagram)
4. Learning Objectives
5. Absolute vs. Comparative Advantage
6. Opportunity Cost: Step-by-Step Logic
7. Numerical Example: Home and Foreign (table)
8. Trade as Indirect Production
9. The Pauper-Labour Fallacy
10. The Ricardian Model: Setup
11. Home's PPF (TikZ: linear PPF + slope right-triangle)
12. Foreign's PPF (TikZ: steeper PPF + slope right-triangle)
13. Comparing Home and Foreign: The Price Gap
14. The Ricardian Trade Theorem
15. World Relative Supply and Demand (TikZ: RS step function + RD)
16. Gains from Trade: Home (TikZ: PPF + trade line + gain arrow)
17. Gains from Trade: Foreign (TikZ: PPF* + trade line + gain arrow)
18. The Terms of Trade: Definition and Welfare
19. Wages, Productivity, and Trade
20. Do Wages Reflect Productivity? (table: 5 countries)
21. Empirical Evidence: The MacDougall Test (1951)
22. Bangladesh vs. China: CA in Action
23. Prairie Wheat: Canada's Classic Ricardian Example [NEW]
24. Canada's Modern Comparative Advantages
25. Worked Example: Wine and Cheese (Setup)
26. Worked Example: Solution
27. Macro Connection: CA, Growth, and the Exchange Rate
28. Limitations and What Comes Next
29. Key Takeaways
30. Discussion Questions

#### Content changes from F25

**Retained from F25:**
- Core model: ULRs, PPF, CA condition, RS/RD equilibrium, gains from trade
- Numerical example parameters (Home a_LC=1, a_LW=2; Foreign a_LC*=6, a_LW*=3)
- Wages and productivity section
- MacDougall test (1951) with table
- Pauper-labour fallacy
- Terms of trade
- Quiz 1 (Wine/Cheese) as worked example

**New content added:**
- Slide 2: Opening puzzle (Bangladesh/Canada) with TikZ flow diagram
- Slide 3: Course-position TikZ diagram (Ricardian → SF → HO → STM)
- Slide 8: "Trade as indirect production" frame with explicit cost comparison
- Slide 23: Prairie Wheat — Canada's first Ricardian export boom (CPR 1885,
  wheat 50% of exports by 1901-14, $8B/year today, 3rd global)
- Slide 27: Macro connections — CA → current account → exchange rate →
  Bank of Canada policy chain; productivity and CAD appreciation 2003–2013
- All TikZ diagrams: redesigned with right-angle slope triangles (no cramped
  dashed autarky lines); PPF and gains-from-trade diagrams rebuilt

**Pedagogical improvements:**
- Q→I→M→D→ℰ→CA→MC→P sequence throughout
- Three-level explanation (intuition → graph → equation) for CA concept
- `canadex` boxes: Bangladesh vs. Canada, Canada's ToT, Prairie Wheat,
  CUSMA North American CA, Productivity and the CAD
- `discuss` box: Bangladesh/China value-chain question; 4 discussion questions
- `worked` box: Quiz 1 setup with step-by-step solution slide
- `varbox` for all variable definitions, model assumptions, OC formulas

#### Visual/layout
- `[shrink=5–15]` applied only to 5 frames (moderate squeeze, text readable)
- All TikZ diagrams: right-angle slope triangles replace ambiguous arrows
- Tables: `\adjustbox{max width=\columnwidth}` wrapping throughout
- `\textcent` works via `\usepackage{textcomp}` (productivity table)
- Right-column diagrams: 51–52% column width for legibility

---

### Ch4 — Specific Factors Model (Chapter 4)

**Status:** ✅ Redesigned  
**F25 slides:** 71 (overloaded; political content scattered; no Canadian examples; no worked example)  
**F26 slides:** 27  
**Estimated lecture time:** ~2 hours  
**File:** `Slides/Ch4/Ch4.tex` → `Ch4.pdf`  
**Compile:** 0 errors, 0 overfull hboxes/vboxes

#### Slide structure (27 slides)
1. Title
2. Opening Puzzle: Hamilton steelworkers vs. auto workers (2018 steel tariffs)
3. Where We Are: course-position TikZ chain diagram
4. Learning Objectives
5. Model Setup: 3 factors, 2 sectors (varbox + insight)
6. Production Functions and MPLs (TikZ diminishing MPL curve)
7. The SF Model PPF: Concave, Not Linear (TikZ concave vs. Ricardian linear comparison)
8. Labour Market Equilibrium: The VMPL Diagram (TikZ crossing VMPL curves)
9. Worked Example: Cobb-Douglas Specific Factors (K=144, T=64, L=100)
10. Worked Example: The VMPL Diagram (pgfplots with exact curves)
11. Effect of Trade: $P_M$ Rises (TikZ VMPL shift diagram)
12. Why Labour's Real Wage is Ambiguous
13. Winners and Losers: Unambiguous Factor Returns (blocks)
14. Summary Table: Winners and Losers (colour-coded table)
15. The Magnification Effect (Jones, 1971) + Alberta Oil Boom table
16. Does the Country Gain Overall? (Kaldor-Hicks + CUSMA dairy)
17. Comparative Advantage in the SF Model (OC = slope of PPF)
18. Canadian Application: Alberta Oil Boom
19. Canadian Application: Ontario Manufacturing and Trade Shocks
20. Canadian Application: Immigration as a Labour Supply Shock
21. Evidence: US Unemployment and Import Penetration (figure)
22. Evidence: The China Shock — manufacturing employment time series (figure)
23. Immigration Data: Canada Among Highest in the OECD (figure)
24. Short Run vs. Long Run: Bridge to Chapter 5 (table + NAFTA timeline)
25. Macro Connection: Sector-Specific Shocks and Bank of Canada
26. Key Takeaways
27. Discussion Questions

#### Content changes from F25

**New content added (not in F25):**
- Slide 3: Course-position TikZ chain diagram
- Slide 7: SF Model PPF (concave vs. Ricardian linear comparison TikZ)
- Slides 9–10: Full Cobb-Douglas worked example (K=144, T=64, L=100 from Exercise 1.tex)
  with pgfplots VMPL diagram
- Slide 17: Comparative advantage from the SF model (OC = MPL_F/MPL_M)
- Slide 18: Alberta Oil Boom mapping (detailed SF model application)
- Slide 19: Ontario Manufacturing and CUSMA trade shocks
- Slide 20: Canada's immigration rate as labour supply shock
- Slide 25: Macro connection — Bank of Canada's one-rate problem for two-speed economy

**Key pedagogical improvements:**
- Q→I→M→D→ℰ→CA→MC→P sequence throughout
- Three-level explanation for VMPL diagram: intuition → diagram → algebra
- `canadex` boxes: Alberta oil boom, CUSMA dairy, Ontario auto capital,
  Canada's immigration system, Bank of Canada one-rate problem
- `worked` box: full Cobb-Douglas example preserving F25 Exercise 1 parameters
- All VMPL diagrams in TikZ/pgfplots (not extracted PPTX images)
- Figures: slide46, slide49, slide60 referenced by lowercase `.png` (case-fix from F25 stub)
- Figure interpretation text updated to match actual figure content

#### Visual/layout
- `[shrink=4–20]` on 9 frames; max content reduction preferred
- Worked example equations collapsed to fewer displayed blocks to avoid clipping
- All `\FIGS` commands use `\columnwidth` (not `\textwidth`) for correct column sizing

---

### Ch5 — Heckscher-Ohlin Model (Chapter 5)

**Status:** 🔄 Pending redesign  
**F25 slides:** 56  
**F26 target:** 35–38 slides  
**Estimated lecture time:** 2.5 hours

*(Changelog entry to be completed after redesign)*

---

### Ch6 — Standard Trade Model (Chapter 6)

**Status:** 🔄 Pending redesign  
**F25 slides:** 52  
**F26 target:** 32–38 slides  
**Estimated lecture time:** 2.5 hours

*(Changelog entry to be completed after redesign)*

---

### Ch7 — Economies of Scale (Chapter 7)

**Status:** 🔄 Pending redesign  
**F25 slides:** 29  
**F26 target:** 30–35 slides  
**Estimated lecture time:** 2.5 hours

*(Changelog entry to be completed after redesign)*

---

### Ch9 — Instruments of Trade Policy (Chapter 9)

**Status:** 🔄 Pending redesign  
**F25 slides:** 56  
**F26 target:** 38–42 slides  
**Estimated lecture time:** 2.5 hours

*(Changelog entry to be completed after redesign)*

---

### Ch10 — Political Economy of Trade Policy (Chapter 10)

**Status:** 🔄 Pending redesign  
**F25 slides:** 0 (no F25 pptx; F26 content is original)  
**F26 target:** 32–35 slides  
**Estimated lecture time:** 2.5 hours

*(Changelog entry to be completed after redesign)*

---

## Technical Standards

### LaTeX/Beamer Specifications
- **Document class:** `beamer`, `aspectratio=169`
- **Theme:** Madrid with UNBCDark overrides
- **Fonts:** lmodern + T1 encoding
- **Figures:** `\includegraphics[width=\textwidth,height=0.68\textheight,keepaspectratio]`
- **Tables:** always wrapped in `\begin{adjustbox}{max width=\textwidth}`
- **Columns:** `\begin{columns}[T]` for vertical top-alignment
- **Custom boxes:** `insight`, `canadex`, `discuss`, `varbox`
- **TikZ:** used for all theoretical diagrams (PPF, supply/demand, labour market)

### Compile Requirement
Every lecture must compile with **0 errors** and **0 overfull hboxes** before proceeding to the next lecture. PDFs are visually inspected for:
- Figure cropping or overflow
- Text running off slide edges
- Unreadable small fonts (minimum ~9pt on slide)
- Broken TikZ diagrams
- Misaligned columns
