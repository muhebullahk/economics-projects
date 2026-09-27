# Paper Summaries — Batch 02

**Papers processed:** Papers 6–10 from `papers_to_read_index.md` (Group B cont. & Group C start)
**Date:** 2026-09-13
**Summarized by:** Claude Code (claude-sonnet-4-6), acting as senior academic economist
**No original files were modified.**

---

## Table of Contents

1. [Hyatt & McEntarfer (2012), AER P&P — Job-to-Job Flows in the Great Recession](#paper-6)
2. [Mueller (2017), AER — Separations, Sorting, and Cyclical Unemployment](#paper-7)
3. [Krusell, Mukoyama, Rogerson & Şahin (2017), AER — Gross Worker Flows over the Business Cycle](#paper-8)
4. [Carrillo-Tudela & Visschers (2023), Econometrica — Unemployment and Endogenous Reallocation](#paper-9)
5. [Asplund & Nocke (2006), RES — Firm Turnover in Imperfectly Competitive Markets](#paper-10)

---

<a name="paper-6"></a>
## Paper 6: Hyatt & McEntarfer (2012)

**Full Citation:** Hyatt, Henry and Erika McEntarfer. "Job-to-Job Flows in the Great Recession." *American Economic Review: Papers & Proceedings* 102(3): 580–583, May 2012.

---

### 1. Research Question

How did flows of workers between jobs — both direct job-to-job transitions and transitions involving nonemployment — change during the Great Recession, and what happened to the earnings changes associated with those flows?

### 2. Motivation

Despite extensive documentation of aggregate unemployment dynamics in the Great Recession, relatively little was known about the underlying worker-level transitions — specifically, how the *type* of job separation (direct job-to-job versus separation through nonemployment) changed in severity and the earnings consequences for each type. Standard labour-market surveys cannot trace workers across employers. Two strands of prior work — Jacobson, Lalonde, and Sullivan (1993) on earnings losses from displacement, and Topel and Ward (1992) on early-career wage growth from job change — had documented that job change matters for lifetime earnings but had not connected these to the cyclical behaviour of transition types. Hyatt and McEntarfer construct the first nationally-anchored longitudinal employer-employee measures of distinct job-to-job flow categories to characterise labour market adjustment during the Great Recession.

### 3. Main Contribution

The paper demonstrates three things using a novel LEHD-derived multi-state pilot database:
1. **Direct job-to-job flows are strongly procyclical** and fell to a 12-year low by early 2009, preceding the official recession start by 1–2 quarters; separations to long nonemployment spells are countercyclical.
2. **Earnings changes from job transitions are procyclical** at every transition type and fell to a series low in the Great Recession; the earnings penalty for nonemployment (the "nonemployment penalty") widened during the recession.
3. **The housing bust case study** shows that residential construction workers experienced a sharp collapse in direct job-to-job flows, much higher rates of industry switching (two-thirds of flows left construction), and median earnings losses of −3.4% for inter-industry movers versus small gains in prior periods.

### 4. Relationship to the Literature

The paper sits at the intersection of (i) gross worker flows (Blanchard-Diamond 1990; DH1992), (ii) job-to-job flow measurement (Fallick-Fleishman 2004; Bjelland et al. 2011; Golan, Lane, McEntarfer 2007), and (iii) earnings dynamics and job change (Jacobson, Lalonde, Sullivan 1993; Topel-Ward 1992). Its contribution is bringing all three together in a quarterly administrative data framework that separates transition types by nonemployment duration, making the earnings-transitions connection tractable. It is a methodological and empirical predecessor to the full Census Bureau J2J statistics program subsequently launched.

### 5. Theoretical Framework / Economic Mechanism

No formal theoretical model is presented. The paper's organizing framework is the observation that the procyclicality of dominant job separations is driven entirely by direct job-to-job flows (same and adjacent quarters), while flows through longer nonemployment spells are countercyclical. This implies a two-force mechanism:
- In good times, workers make frequent job-to-job moves to capture wage gains (procyclical quits driving procyclical J2J flows).
- In recessions, workers are reluctant to quit (collapsing J2J flows) and involuntary separations spike into long nonemployment spells. The resulting longer spells generate larger earnings losses on return, amplifying the recession's earnings-distribution effects.

### 6. Data

- **Dataset:** LEHD (Longitudinal Employer-Household Dynamics) multi-state pilot database
- **Coverage:** 9 anchor states (California, Florida, Georgia, Illinois, Kansas, Michigan, Nevada, North Carolina, North Dakota); national job histories constructed for these workers covering flows to/from 40+ states
- **Period:** 1998–2010 (quarterly)
- **Sample:** Workers who held at least one primary (maximum earnings) job in the 9-state frame
- **Flow types constructed:** (1) job-to-job within same quarter; (2) job-to-job with new job in adjacent quarter; (3) separation to nonemployment with 1 full quarter between jobs; (4) separation to nonemployment with >1 quarter of nonemployment; (5) dominant job separations (total of all)
- **Limitation:** Administrative data cannot distinguish unemployed from out-of-labour-force; nonemployment durations only approximately observed in quarterly earnings records

### 7. Empirical Strategy

Purely descriptive. The strategy involves:
1. Classifying separators by the duration of the intervening nonemployment spell between primary jobs.
2. Computing seasonally adjusted quarterly time series for each flow type (Figure 1) and median earnings changes for each transition type (Figure 2).
3. A focused case study of residential building construction (NAICS 2361): computing the frequency and industry destination of job-to-job flows originating in construction, along with associated earnings changes, across three time periods (2001–03, 2004–06, 2007–09).

### 8. Identification Strategy

No causal identification. The paper is descriptive measurement. It establishes correlations between transition types and the business cycle but makes no causal claim about what *drove* the changes in flows. The comparison across periods for residential construction is descriptive (Table 1) and not an event study with a control group.

### 9. Main Results

**Aggregate J2J flows (Figure 1):**
- Direct J2J flows (same and adjacent quarters) are strongly procyclical; they began falling in early 2007, 1–2 quarters *before* the official recession start.
- Both direct J2J types fell to a series 12-year low by early 2009.
- Separations to nonemployment lasting 1 quarter: no cyclical pattern.
- Separations to nonemployment lasting >1 quarter: slight countercyclical pattern; a large spike in late 2008 driven almost entirely by spells lasting ≥1 year.

**Earnings changes from job transitions (Figure 2):**
- In 2006:Q2, median earnings changes by type: direct J2J +9%; adjacent quarter +3.8%; 1 quarter nonemployment 0%; 2–3 quarters nonemployment −1.2%.
- All types show procyclical comovement in earnings changes.
- Earnings gains for direct J2J flows in the Great Recession are similar to the 2001 recession, but earnings *losses* for workers with 2–3 quarters of nonemployment are greater.
- The "penalty" for nonemployment is larger in 2007–09 than in prior periods.

**Residential construction (Table 1):**
- J2J flows from construction: fell from 100% baseline (2004–06) to ~70% of that level (2007–09).
- Share of flows remaining in construction: dropped as two-thirds of movers left the sector.
- Median earnings change within residential construction: +5.2% (2004–06) → −0.6% (2007–09).
- Median earnings change moving to other sectors: +2.7% (2004–06) → −3.4% (2007–09).
- Largest sector receiving construction workers: Accommodation and Food Services (grew 2+ pp in share), associated with 13–21% downward earnings moves.

### 10. Economic Magnitude and Interpretation

The collapse in direct J2J flows is the dominant story. The fact that J2J flows began falling 1–2 quarters before the official recession start (NBER December 2007) suggests that the labour market "felt" the recession through job-switching channels before it showed up in unemployment rates. The 70% decline in J2J flows from construction implies that roughly 30% of the job-changing activity that normally keeps construction workers on career ladders simply stopped. The dramatic earnings penalties (−10.6% for retail trade movers; −20% for accommodation movers from construction) illustrate how sectoral reallocation during the housing bust imposed large permanent earnings losses, consistent with Roy-model sorting into low-match-quality jobs under duress.

### 11. Mechanisms

The paper identifies two central mechanisms through the data:
1. **Procyclical J2J driven by voluntary quits:** In good times, direct J2J flows represent workers pursuing wage gains up a job ladder. The collapse in J2J in 2007–09 is consistent with workers ceasing to voluntarily separate (quasi-locking in) and employers being unwilling to hire. This is distinct from the *level* of dominant separations falling.
2. **Earnings penalty amplified by nonemployment duration:** The longer the spell between jobs, the greater the earnings loss. This is consistent with human capital depreciation during nonemployment, stigma effects, or mismatch (being forced into lower-quality matches at reemployment). The Great Recession worsened this penalty.

### 12. Robustness Checks

This is a short P&P paper with no explicit robustness section. The multi-state pilot database construction follows established conventions from Bjelland et al. (2011) and Fallick, Haltiwanger, and McEntarfer (2011). The key methodological choice — restricting to flows between *primary* (highest earnings) jobs — is motivated by Bjelland et al.'s finding that most direct J2J flows are between primary jobs. The paper notes explicitly that it cannot distinguish the unemployed from NILF.

### 13. Limitations

1. **P&P format (4 pages):** No room for regression analysis, controls for worker characteristics, or tests of statistical significance.
2. **Nine-state frame:** Workers must have had at least one job in 9 anchor states — not a nationally representative sample.
3. **Cannot distinguish U from N:** LEHD administrative data shows only earnings; no information on search behaviour.
4. **Nonemployment duration measured approximately:** A worker with 1 full quarter of nonemployment between jobs actually had 3–8 months without a primary job — imprecise.
5. **No causality:** The housing bust case study is descriptive; no counterfactual is constructed for what would have happened to construction workers absent the bust.
6. **No formal separation of supply and demand drivers:** The paper cannot determine whether falling J2J flows reflect employers' unwillingness to hire or workers' unwillingness to quit.

### 14. Policy Implications

- The finding that J2J flows collapsed even *before* the official recession start suggests that labour market "fluidity" measures (not just unemployment rates) should be tracked as leading indicators.
- The large earnings losses for construction workers moving to other sectors (~−3.4% for those moving out; worse for accommodation and food services destinations) highlight the welfare costs of structural reallocation during sectoral busts and support targeted retraining policies for displaced construction workers.
- Since direct J2J flows are the primary vehicle for early-career wage growth (Topel-Ward 1992), their cyclical collapse implies recession-scarring effects on youth wage trajectories that may outlast the recession itself.

### 15. Overall Assessment

This is a high-quality descriptive paper that opens up an important new data source and establishes several clean stylised facts about how the *type* of worker transition changes over the business cycle. Its strength is in the data construction and the clarity of the empirical patterns. Its weakness is the P&P format which prevents deeper analysis. The findings motivate a much larger follow-up research agenda (which the full J2J statistics program at the Census Bureau subsequently pursued).

**Quality: Good for its format. Clean measurement, novel facts, important policy context.**

### 16. Relevance to My Research

Directly relevant for Canadian RDC work. LEED or the Longitudinal Worker File can be used to construct analogous J2J flow series for Canada, tracing workers across employers with administrative quarterly earnings data. Testing whether Canadian J2J flows are equally procyclical, and whether the Great Recession produced similar J2J collapse dynamics (potentially exacerbated by the commodity boom–bust in resource provinces), would be a natural paper. The construction-industry case study could be replicated for the Alberta oil-and-gas sector or the B.C. housing market.

### 17. Potential Research Extensions

- Construct Canadian J2J flow series from LEED for 2000–2024; compare procyclicality magnitude to U.S.
- Study J2J flows from resource-sector workers during commodity busts (2014–16 oil price crash; COVID-19)
- Estimate earnings losses from resource-sector displacement in Alberta versus manufacturing displacement in Ontario

### 18. Research Gaps

- No formal distinction of supply-side (workers not quitting) vs. demand-side (employers not hiring) mechanisms
- No analysis of how J2J flows differ by worker age, education, or tenure — all of which would affect career-ladder interpretations
- The paper cannot establish whether the earnings changes represent permanent scars or transitory adjustments

### 19. Methodological Lessons

1. Restricting J2J flow measurement to *primary* jobs (highest earnings in the quarter) is crucial to avoid conflating short-term secondary jobs with meaningful career transitions.
2. Separating direct J2J from transitions through nonemployment by duration bracket (0, 1, >1 quarter) is a simple but powerful typology that reveals very different cyclical patterns.
3. Leading indicators of the recession appear in J2J flows 1–2 quarters before the official NBER recession start date — a useful data feature for real-time monitoring.

---

**Five-Sentence Summary**

Hyatt and McEntarfer (2012) use a nine-state LEHD pilot database to construct quarterly measures of four types of worker transitions — direct job-to-job flows, flows with short nonemployment, and flows with longer nonemployment — for the period 1998–2010. They show that direct job-to-job flows are strongly procyclical, began declining in early 2007 before the official recession start, and fell to a 12-year low by early 2009, while separations to long nonemployment spells spike countercyclically. Earnings changes associated with all job transitions are procyclical, with direct J2J movers earning roughly 9% more at reemployment in booms versus near 0% in recessions, and the earnings penalty for nonemployment is larger in the Great Recession than in prior downturns. A case study of residential construction reveals that the housing bust caused J2J flows to fall to 70% of their pre-recession level, two-thirds of movers left the construction sector, and median earnings changes turned negative across all destinations. The paper establishes that cyclical movements in the labour market are not homogeneous — direct J2J flows (the primary vehicle for career advancement) collapse disproportionately in recessions, with lasting consequences for worker earnings trajectories.

| | |
|---|---|
| **Key contribution** | First quarterly J2J flow series from LEHD separating transition types by nonemployment duration; shows direct J2J flows lead the recession and collapse to 12-year lows; documents procyclical earnings changes |
| **Key weakness** | Short P&P format (4 pages); no statistical inference; nine-state frame not nationally representative; cannot distinguish U from N |
| **Most interesting gap** | The mechanism — whether J2J collapse reflects workers not quitting or employers not hiring — is unresolved; identifying this distinction has major implications for policies targeting labour market fluidity |
| **Publishable extension** | Construct Canadian J2J flow series from LEED 2000–2024, distinguishing flow types by nonemployment duration; study resource-sector workers in commodity bust cycles (Alberta 2014–16) as a quasi-experiment for sectoral J2J collapse |

---

<a name="paper-7"></a>
## Paper 7: Mueller (2017)

**Full Citation:** Mueller, Andreas I. "Separations, Sorting, and Cyclical Unemployment." *American Economic Review* 107(7): 2081–2107, July 2017.

---

### 1. Research Question

Does the composition of the pool of unemployed workers shift systematically over the business cycle, and if so, in which direction — toward higher- or lower-wage workers? What drives this compositional shift — separations or job-finding rates? And can standard or modified theories of wage setting and unemployment account for the observed pattern?

### 2. Motivation

A large literature on cyclical real wages (Solon, Barsky, Parker 1994) documents that the composition of the *employed* pool shifts toward higher-wage workers in recessions (because low-wage workers are more likely to lose their jobs). One might expect the composition of the *unemployed* pool to shift in the opposite direction toward lower-wage workers. Mueller documents that this intuition is *wrong*: the unemployed pool shifts toward *higher*-wage workers in recessions. This is not merely an arithmetic accident — the result is driven by the strongly differential cyclicality of separation rates across wage groups. The finding has important implications for hiring incentives, aggregate labour market dynamics, and the "unemployment volatility puzzle" (Shimer 2005).

### 3. Main Contribution

1. **A new empirical fact:** The pre-displacement wage of unemployed workers rises strongly in recessions. A 1 percentage-point increase in the unemployment rate is associated with a 1.5 pp increase in the average wage *rank* of the unemployed (correlation 0.67 in CPS ORG, 0.73 in March CPS). This holds for raw wages, wage ranks (ruling out wage compression), and Mincer residuals (controlling for demographics, education, industry, occupation).

2. **Mechanism identification:** The compositional shift is *almost entirely driven by separations*, not job-finding rates. High-wage workers have substantially more cyclical separation rates than low-wage workers; job-finding rates show similar cyclicality across wage groups.

3. **Theory evaluation:** Standard theories (search-matching with match-specific shocks, rigid wages, compensating differentials) fail to explain the fact — they predict shifts toward low-wage or no shift at all. Two extensions succeed: (i) lower variance of match-specific productivity shocks for high-ability workers; (ii) cash-flow constraints in recessions.

### 4. Relationship to the Literature

- Extends Solon, Barsky, Parker (1994) — who showed employed pool shifts toward high-wage in recessions — to the unemployed pool, showing the two pools can shift in the *same* direction.
- Related to Bils, Chang, Kim (2012) who study cyclical employment, separations, and job findings for wage groups (SIPP 1983–2003) but do not focus on composition of the unemployed pool.
- Challenges Pries (2008) who assumes the unemployed pool shifts toward *low*-ability workers.
- Contributes to the "unemployment volatility puzzle" literature (Shimer 2005): high-ability unemployed raise returns to vacancy posting, *dampening* the aggregate separation → hiring → unemployment volatility chain — an additional challenge for amplification mechanisms.

### 5. Theoretical Framework / Economic Mechanism

**Key accounting equation:** The fraction of group $i$ among the unemployed is:
$$\phi^U_{it} = \phi^L_{it} \cdot \frac{U_{it}}{U_t}$$
where $\phi^L_{it}$ is group $i$'s share of the labour force and $U_{it}$ is group $i$'s unemployment rate. Changes in $\phi^U_{it}$ decompose into:
$$d\phi^U_{it} \approx \phi^U_{it}(1-\phi^U_{it})\left[(1-U^{ss}_{it})(d\ln s_{it} - d\ln f_{it}) - (1-U^{ss}_{jt})(d\ln s_{jt} - d\ln f_{jt})\right]$$
This shows compositional changes in the unemployed pool depend on *relative* log changes in separation ($s$) and job-finding ($f$) rates, weighted by steady-state employment rates.

**Standard search-matching model:** Fails because in the baseline model, low-wage workers are more likely to be near the separation threshold, so adverse aggregate shocks push more low-wage workers into unemployment — the opposite of the data.

**Successful Extension 1 — Lower match variance for high-ability workers:** If the variance of match-specific productivity shocks is lower for high-ability workers, the density of matches at the separation threshold is *higher* for high-ability workers (matches are more concentrated near the threshold). Aggregate shocks that shift the threshold generate larger responses for high-ability workers, producing the observed procyclicality of high-wage separations. This calibration also preserves near-equal cyclicality of job-finding rates across groups (consistent with the data).

**Successful Extension 2 — Credit constraints:** If firms face cash-flow constraints in recessions, they may separate from workers whose current match productivity is negative even if the net present value of the match is positive. Marginal matches with high-ability workers generate more negative current cash flows (paid above current productivity in expectation of future returns), making them more sensitive to credit tightening.

### 6. Data

- **Primary:** CPS Outgoing Rotation Groups (ORG), private-sector workers aged 16–64, 1980–2012; N = 1,203,543, of whom 79,463 experienced ≥1 month of unemployment in interview months 5–8.
- **Extended:** CPS March Supplement, 1962–2012 (backward-looking wages; full 50-year coverage; no attrition).
- **Cross-validation:** Monthly CPS basic files 1978–2012 (demographic composition of unemployed).
- **Additional:** NLSY79 1979–2012 (N = 6,923; distinguish permanent vs. transitory wage components; 193,467 yearly observations on labour force status).

### 7. Empirical Strategy

1. **Direct measurement of composition:** Compute average log previous wage, average wage rank (ordinal), and average Mincer residual wage for the unemployed pool in each year. HP-filter (λ=100) and correlate with the HP-filtered aggregate unemployment rate.

2. **Decomposition of compositional shifts:** Regress each component of the predicted wage (experience, education, gender, marital status, race, state, industry, occupation dummies) separately on the detrended unemployment rate (Table 1) to identify which observable characteristics drive the shift.

3. **Separation vs. job-finding decomposition (Equation 5):** Using Elsby-Michaels-Solon (2009) flow approach, compute group-specific $(s_{it}, f_{it})$ from matched CPS panels and assess which margin drives $d\phi^U_{it}$.

4. **Structural model evaluation:** Calibrate baseline and extended models to match average separation rates by wage group; compare predicted compositional shifts to data.

### 8. Identification Strategy

**The key empirical claim (the new fact) is correlational, not causal.** The paper documents that the composition of the unemployed shifts toward high-wage workers over the business cycle — this is established as a statistical fact across multiple data sources and specifications. No claim is made about *what causes* the aggregate cycle; the direction of causality runs from aggregate conditions to compositional shifts.

**Important identification challenge:** The composition of workers who lose their jobs could reflect true changes in separation behaviour *or* changes in the composition of employed workers (who is at risk of separation changes with the cycle). The Mincer residual specification (controlling for education, experience, gender, industry, occupation, race, state, year) goes some way toward isolating the residual effect, but residual wages partly capture unobservable worker quality. The NLSY79 analysis provides evidence that the compositional changes are associated with *permanent* worker fixed effects (not transitory match effects).

### 9. Main Results

**Fact (Figure 3 and 4, Table 1):**
- Correlation of average pre-displacement log wage with aggregate unemployment rate: 0.60 (CPS ORG); 0.59 (March CPS).
- Correlation of average wage *rank*: 0.67 (CPS ORG); 0.73 (March CPS).
- Correlation of average Mincer residual: 0.44 (CPS ORG); 0.60 (March CPS).
- A 1 pp increase in unemployment rate → 2.77% increase in average raw pre-displacement wage (ORG); 1.5 pp increase in average wage rank; 0.75% increase in average residual wage.
- The pattern appears in *every recession since 1962*.

**Observable drivers (Table 1):**
- Industry accounts for ~25% of the total compositional shift; demographics and residuals explain remaining 75%.
- All observable components shift in the *same direction* — more experienced, more educated, more likely male, married, white, and from high-wage industries and occupations.

**Separation vs. job-finding:** The compositional shift is *almost entirely driven by separations*. High-wage workers have substantially more cyclical log separation rates; the cyclicality of log job-finding rates is similar across wage groups.

**Magnitude from recession episodes:** The magnitude of compositional shifts is much larger than corresponding shifts in the *employed* pool, consistent with compositional changes being concentrated at the unemployment margin.

**Model results:** Standard baseline DMP model: generates shifts toward *low*-ability workers — wrong direction. Extension 1 (lower match variance for high-ability workers): generates shifts toward high-ability workers and correct directional predictions for all moments. Extension 2 (credit constraints): consistent for recessions with financial stress but inconsistent for others.

### 10. Economic Magnitude and Interpretation

The magnitude of 1.5 percentage points increase in average wage rank per 1 pp increase in unemployment rate is economically significant — it implies that the average unemployed worker moves from, say, the 50th to the 51.5th percentile of the wage distribution for each 1 pp rise in unemployment. Over a typical recession (3 pp rise in unemployment), this amounts to the average unemployed worker being at about the 54.5th percentile rather than the 50th. The estimated dampening of aggregate hiring responses due to this compositional shift (up to 3.6× dampening of steady-state elasticities, Online Appendix G.1) is quantitatively important for the unemployment volatility puzzle.

### 11. Mechanisms

The paper points to the **lower variance of match productivity for high-ability workers** as the more convincing mechanism. The key intuition:
- High-ability workers have matches that are more tightly clustered near the separation threshold because the productivity distribution is tighter.
- The same aggregate productivity shock that shifts the separation threshold by a given amount therefore causes a larger mass of high-ability worker matches to cross the threshold.
- This generates higher cyclicality of separations for high-ability workers without requiring asymmetric cyclicality of job-finding rates.

The **credit constraint** mechanism is also plausible but has an internal consistency problem: it predicts no compositional shift in recessions without clear financial market disruption (e.g., 1970–71 recession, 1981–82 recession before credit crunch emerged). The data show the compositional shift in *all* recessions back to 1962.

### 12. Robustness Checks

- Three data sources (CPS ORG, March CPS, monthly CPS, NLSY79) show highly consistent results.
- Results robust to: controlling for demographic characteristics; ordinal wage rank (rules out wage compression); Mincer residual wage (rules out composition through observables).
- NLSY79 analysis distinguishing permanent worker effects from transitory match effects confirms the shift is associated with permanent worker quality, not transitory wages.
- Analysis extends back to 1962 in March CPS — the pattern holds in every recession.
- Specification varies: HP-filtered vs. unfiltered unemployment rate; yearly averages; exclusion of long-term unemployed (note: long-term unemployment exclusion matters post-2008, flagged explicitly).

### 13. Limitations

1. **Long-term unemployment exclusion:** CPS ORG excludes workers unemployed >12 months (due to attrition in the rotating panel). This exclusion is minor before 2008 (<13.3% of unemployed) but becomes substantial post-2008 (up to 31.2% of unemployed), biasing results for the recent period.
2. **Identification of mechanisms is indirect:** The paper evaluates theoretical models but cannot directly test whether match productivity variance is lower for high-ability workers — this is a maintained calibration assumption.
3. **Credit constraint test is indirect:** The Chodorow-Reich (2014)-based test for credit shocks is promising but not definitive.
4. **Log separation rates assumed informative:** The decomposition uses log flow rates (not levels) because average separation rates differ across groups. This is methodologically motivated but assumes log-linearity in the flow decomposition.
5. **Causality:** The paper documents a correlation between cycle phase and the composition of the unemployed. While the accounting decomposition clarifies the proximate driver (separations), it does not identify the deep causal factor.

### 14. Policy Implications

- **Composition bias in recession policy evaluation:** Any programme that targets the unemployed (UI, job training, active labour market policies) will have a different composition of beneficiaries in recessions versus expansions. Mueller's finding suggests programmes will have higher-ability participants in recessions, potentially explaining Card, Kluve, Weber's (2015) finding that active labour market programmes are more effective in recessions.
- **Unemployment insurance:** Cyclical shifts toward high-wage workers in the unemployment pool mean UI replacement rates (typically a fixed fraction of prior wages) provide *higher* absolute benefits in recessions — an automatic stabiliser amplification.
- **Aggregate hiring incentives:** The compositional shift toward high-ability unemployed in recessions raises the average return to posting vacancies, potentially dampening the negative vacancy response to adverse productivity shocks. This is anti-Shimer — it provides a partial automatic stabiliser on the hiring side.

### 15. Overall Assessment

Mueller (2017) is a clean, careful, and important empirical paper that establishes a new fact about the cyclical composition of unemployment and rigorously rules out obvious alternative explanations. The empirical work is exemplary: three data sources, 50 years of data, multiple specifications, and a clear accounting framework. The theoretical section is more provisional — the paper is honest that neither extension fully resolves the puzzle — but it usefully narrows the space of viable theoretical explanations. The most significant contribution is the implication for the unemployment volatility puzzle: the compositional shift toward high-ability workers in recessions *dampens* aggregate hiring responses, making it even harder for standard models to generate sufficient unemployment volatility.

**Quality: Very good. A carefully executed empirical paper with an important new fact and sound theoretical interpretation.**

### 16. Relevance to My Research

Relevant to any RDC project studying worker heterogeneity in unemployment dynamics. For Canadian work, LEED or matched CPS-style data could be used to test whether the Canadian unemployed pool also shifts toward higher-wage workers in recessions. The resource sector dimension is particularly interesting: during commodity price busts, the separated workers are likely from high-wage resource jobs, which could amplify the Mueller sorting effect in resource provinces.

### 17. Potential Research Extensions

- Test the Mueller fact for Canada using matched CPS-equivalent data or LEED; does the Canadian unemployed pool also shift toward high-wage workers, and is the effect larger in resource provinces during commodity busts?
- Estimate whether the compositional shift affects the cyclicality of aggregate wage indices and UI programme costs in Canada

### 18. Research Gaps

- The paper cannot directly distinguish the credit constraint mechanism from the lower match variance mechanism; a direct firm-level test using credit supply shocks would be needed
- The analysis stops at 2012; the composition of unemployment during COVID-19 (which primarily destroyed low-wage service jobs) would likely show the *opposite* shift — a natural out-of-sample test

### 19. Methodological Lessons

1. The accounting equation linking the share of group $i$ in the unemployed pool to group-specific unemployment rates and labour force shares is essential for avoiding the erroneous inference that more cyclical unemployment rates for low-skill workers imply the unemployed pool shifts toward low-skill workers.
2. Wage *ranks* (ordinal) are more informative than wage levels for testing compositional changes because they are immune to wage compression (level changes in dispersion) as an alternative explanation.
3. The Elsby-Michaels-Solon (2009) flow decomposition (Equation 4-5) provides a clean framework for attributing compositional changes in the unemployed pool to separations versus job-finding rates.

---

**Five-Sentence Summary**

Mueller (2017) documents a new fact using 50 years of CPS data: in recessions, the pool of unemployed shifts toward workers with *higher* pre-displacement wages, with a 1 percentage-point rise in unemployment associated with a 1.5 pp increase in the average wage rank of the unemployed — a pattern that holds in every recession since 1962, for raw wages, wage ranks, and Mincer residuals. The compositional shift is almost entirely driven by *separations*: high-wage workers have substantially more cyclical separation rates, while job-finding rate cyclicality is similar across wage groups. Standard search-matching models generate shifts in the *opposite* direction; two extensions succeed — lower variance of match productivity for high-ability workers and credit cash-flow constraints — with the former being the more broadly applicable explanation. The finding implies that the pool of unemployed is higher quality in recessions, raising returns to vacancy posting and potentially *dampening* the aggregate hiring response to adverse shocks — an additional challenge for the unemployment volatility puzzle. The paper also shows that compositional changes in the unemployed pool are substantially larger in magnitude than the corresponding changes in the employed pool, implying that standard composition-bias corrections are insufficient for statistics related to the unemployed.

| | |
|---|---|
| **Key contribution** | New empirical fact (robust across 3 data sources, 50 years): the unemployed pool shifts toward high-wage workers in recessions, driven almost entirely by the higher cyclicality of separations for high-wage workers |
| **Key weakness** | The two successful theoretical extensions cannot be distinguished empirically with available data; the credit constraint mechanism is internally inconsistent for recessions without financial stress |
| **Most interesting gap** | COVID-19 likely produced the *opposite* compositional shift (low-wage service workers primarily displaced), providing an out-of-sample test of whether the Mueller mechanism operates symmetrically |
| **Publishable extension** | Replicate Mueller's decomposition for Canada using matched LFS data; test whether the compositional shift toward high-wage unemployed is amplified in resource provinces during commodity busts, and assess whether this dampens hiring responses in those regions |

---

<a name="paper-8"></a>
## Paper 8: Krusell, Mukoyama, Rogerson & Şahin (2017)

**Full Citation:** Krusell, Per, Toshihiko Mukoyama, Richard Rogerson, and Ayşegül Şahin. "Gross Worker Flows over the Business Cycle." *American Economic Review* 107(11): 3447–3476, November 2017.

---

### 1. Research Question

Can a parsimonious model combining standard labour supply forces (heterogeneous agents with idiosyncratic productivity shocks) and labour market frictions (search and matching) simultaneously account for the cyclical properties of *all six* gross worker flow rates across employment (E), unemployment (U), and nonparticipation (N)?

### 2. Motivation

The E–U and U–E flows between employment and unemployment have been extensively studied since Blanchard-Diamond (1990) and Shimer (2012). However, these papers largely ignored flows into and out of nonparticipation (N), even though the N state is quantitatively large (≈35% of the population). Krusell et al. document two key empirical patterns ignored by standard models: (i) flows between N and the other states are as volatile over the business cycle as flows between E and U; and (ii) the U-to-N transition rate is *procyclical* — workers transition from unemployment to nonparticipation *more* in booms — despite the fact that the participation rate is procyclical. These counterintuitive patterns challenge both pure Lucas-Rapping labour supply models (which cannot generate U) and pure search models (which have no participation margin). The paper builds a hybrid that can match all six flows.

### 3. Main Contribution

1. **Documented new facts about gross worker flows:** All six $f_{ij}$ transition rates documented quarterly for 1978:Q1–2012:Q3 with two misclassification corrections (Abowd-Zellner; deNUNification). Key counterintuitive fact: $f_{UN}$ (U to N) is *procyclical* (Table 3).

2. **First structural model to match all six steady-state flow rates:** The calibrated model matches all six average flow rates within 95% confidence intervals — the first paper to achieve this. Previous models could not match flows involving N accurately.

3. **Intertemporal substitution in a frictional model:** Even though the wage per efficiency unit is constant, intertemporal labour supply effects emerge because higher $f_{EE}$ (job-to-job) flows in booms allow workers to move up the job-quality ladder faster, raising the return to participation. This generates a procyclical incentive for the unemployed to transition to N in *booms* (because the unemployed pool in booms contains more workers close to being indifferent about participating).

4. **Participation accounts for one-third of unemployment fluctuations:** Flows between participation and nonparticipation account for ≈33% of fluctuations in the unemployment rate, far larger than previously estimated.

### 4. Relationship to the Literature

The paper bridges three literatures: (i) labour supply heterogeneous-agent models (Lucas-Rapping 1969; Chang-Kim 2006); (ii) search-matching models (Mortensen-Pissarides 1994; Shimer 2012); (iii) gross worker flows with participation (Elsby, Hobijn, Şahin 2015; Tripier 2004; Shimer 2013). Its key distinction from existing hybrid models is the focus on *gross worker flows* rather than stocks alone. It also differs from Chang-Kim (2006) by introducing realistic labour market features (UI, on-the-job search, heterogeneous match quality).

### 5. Theoretical Framework / Economic Mechanism

**Individual preferences:**
$$\mathbb{E}_t \sum_{t=0}^{\infty} \beta^t \left[\log(c_t) - \alpha e_t - \gamma s_t\right]$$
where $c_t$ is consumption, $e_t \in \{0,1\}$ is employment, $s_t \in \{0,1\}$ is active job search, with $\alpha > 0$ (disutility of work), $\gamma > 0$ (disutility of search).

**Idiosyncratic productivity:** $\log z_{t+1} = \rho_z \log z_t + \varepsilon_{t+1}$, $\varepsilon_{t+1} \sim N(0, \sigma_\varepsilon^2)$.

**Labour market frictions:** Four friction parameters:
- $\lambda_u$: probability of employment offer for active searcher (unemployed)
- $\lambda_n$: probability of offer for passive searcher (NILF)
- $\lambda_e$: probability of outside offer for employed worker (on-the-job search)
- $\sigma$: job separation rate

**Match quality:** Each offer comes with a match quality draw $q \sim \text{LogNormal}(0, \sigma_q^2)$; employed workers can accept better matches through on-the-job search.

**Bellman equations:** Three value functions for an individual without a job offer, $J(a, z, \gamma, I^B, \Lambda) = \max\{U(\cdot), N(\cdot)\}$, with employment $W(\cdot)$ optimal given match quality. Aggregate shocks operate through $\Lambda = (w, r, \lambda_u, \lambda_n, \lambda_e, \sigma)$.

**Mechanism for procyclical U-to-N:** In booms, the unemployment pool is disproportionately populated by individuals who are *close to indifferent* between participating and not (because workers with strong labour market attachment have already found jobs in the boom). This marginal worker is more likely to transition to N, generating the counterintuitive procyclical $f_{UN}$.

### 6. Data

- **CPS gross worker flows:** Monthly CPS matched surveys, 1978:Q1–2012:Q3; six $f_{ij}$ transition rates computed (E→U, E→N, U→E, U→N, N→E, N→U).
- **Misclassification corrections:** (1) Abowd-Zellner (1985) reinterview-based correction; (2) deNUNification (recodes sequences U→N→U as U→U→U). Both adjustments systematically reduce flow rates involving N. The Abowd-Zellner correction substantially increases volatility of N-adjacent flows; deNUNification does not.
- **SIPP:** Used to validate model predictions for gross flow rates by *wealth* (wealth data absent from CPS).
- **Calibration targets:** Labour force participation rate (0.66), unemployment rate (0.068), E→U flow (0.014), N→E flow (0.022); all 1978–2012 averages.
- **Additional calibration:** Job-to-job transition rate (2.2%/month; Fallick-Fleischman 2004); average wage gain on J2J transition (3.3%; Tjaden-Wellschmied 2014).

### 7. Empirical Strategy

**Empirical documentation:** Tabulate and describe the cyclical properties of all six gross flow rates using HP-filtered quarterly series (Table 1 for stocks; Table 3 for gross flows). Key statistics: standard deviations, correlation with GDP, first-order autocorrelation.

**Model evaluation:** Calibrate the steady-state model to match average flows (Table 4–5); then subject the calibrated model to aggregate shocks $(\lambda_u, \lambda_n, \lambda_e, \sigma)$ drawn from data on job-finding and separation rates; compare cyclical moments of model-generated gross flows to empirical equivalents (Table 6).

### 8. Identification Strategy

Calibration, not formal econometric identification. The parameters are set through: (a) external calibration (idiosyncratic shock process from wage panel studies; UI parameters from programme data; tax rate from effective tax rate literature); (b) calibration to match specific steady-state moments (participation rate, unemployment rate, E→U rate, N→E rate, job-to-job rate, wage gain on J2J); (c) the remaining preference parameters determined implicitly by the model's fixed-point conditions. No causal identification in the econometric sense.

### 9. Main Results

**Empirical facts (Table 3):**

| Flow | Std dev | Corr w/ GDP | Pattern |
|------|---------|-------------|---------|
| $f_{EU}$ | 0.089 (AZ) | −0.63 | Countercyclical ✓ |
| $f_{EN}$ | 0.083 (AZ) | +0.43 | **Procyclical** ← counterintuitive |
| $f_{UE}$ | 0.088 (AZ) | +0.76 | Procyclical ✓ |
| $f_{UN}$ | 0.106 (AZ) | +0.61 | **Procyclical** ← counterintuitive |
| $f_{NE}$ | 0.103 (AZ) | +0.52 | Procyclical ✓ |
| $f_{NU}$ | 0.072 (AZ) | −0.23 | Weakly countercyclical |

Note: $f_{UN}$ procyclical means workers *leave* unemployment toward nonparticipation *more* in booms — counterintuitive for a "discouraged worker" interpretation.

**Calibration (Table 5):** Model matches all six average flow rates within 95% confidence intervals. First paper to achieve this.

**Cyclical performance (Table 6):** Model does well on most moments but is quantitatively imprecise on some volatility measures. The participation margin accounts for ≈1/3 of unemployment fluctuations.

**Intertemporal substitution role:** Despite constant wage per efficiency unit, intertemporal substitution operates through job ladder dynamics — higher J2J flows in booms increase career returns, creating more incentive to participate *now*.

### 10. Economic Magnitude and Interpretation

The finding that flows involving nonparticipation are as volatile as E–U flows challenges the conventional focus on unemployment-employment dynamics alone. The U–N transition accounting for ≈33% of unemployment fluctuations means that roughly one-third of the cyclical rise in unemployment is not about the unemployed failing to find jobs (low $f_{UE}$) or losing jobs (high $f_{EU}$), but about the unemployed giving up and exiting the labour force in recessions. This also implies that the "unemployment rate" is a noisy measure of labour market slack — changes in LFPR confound the unemployment signal. The procyclical $f_{UN}$ finding (more workers leave unemployment for N in booms) reflects a selection effect: the boom "clears" the good matches, leaving behind the marginal unemployed who are most likely to transition to N.

### 11. Mechanisms

Two forces nearly cancel to produce the weak procyclicality of the participation rate:
1. **Wealth effect (reduces participation in booms):** In good times, households accumulate more assets; the income effect of higher wealth reduces desire to work.
2. **Intertemporal substitution (increases participation in booms):** Higher job-to-job flows in booms mean participating now accelerates movement up the job quality ladder, raising the return to current participation.

The near-cancellation of these two forces explains why the participation rate fluctuates much less than either unemployment or employment (Table 1: std of LFPR = 0.0026 vs. std of unemployment rate = 0.117).

The procyclical $f_{UN}$ is explained by composition: in booms, the unemployment pool is more heavily populated by workers close to the U–N indifference margin (strongly attached workers have already transitioned to E), so the rate at which unemployed workers flow to N is higher in booms.

### 12. Robustness Checks

- Two misclassification correction methods (Abowd-Zellner and deNUNification) give quantitatively similar cyclical properties; both adjustments are shown in Table 3.
- Model performance evaluated against both AZ and deNUNified data in Table 6.
- Steady-state flow matching exercises validated using SIPP wealth-conditional flow data.
- The paper ran an earlier GE version of the model (Krusell et al. 2012) and found quantitatively similar results — the PE assumption is not driving the main findings.

### 13. Limitations

1. **Partial equilibrium:** Prices and aggregate frictions are taken as exogenous; the model does not endogenise wage determination or vacancy posting.
2. **Aggregate shocks are friction shocks only:** The paper feeds in shocks to job-finding and separation rates but does not connect these to technology, demand, or monetary policy shocks. The source of cyclical fluctuations is not identified.
3. **Quantitative mismatch on some moments:** Table 6 shows the model does not fully replicate all six cyclical moments simultaneously.
4. **Representative worker in stylised form:** No age, gender, education heterogeneity — all of which are empirically important for N dynamics.
5. **Monthly calibration:** The model is calibrated monthly, but CPS flows have known monthly measurement error issues that may not be fully addressed by the Abowd-Zellner correction.

### 14. Policy Implications

- Because flows into and out of N are as large as E–U flows cyclically, policies targeting unemployment (UI, ALMP) affect flows from N as well — the participation margin is a first-order policy variable.
- The intertemporal substitution channel (job ladder improvement in booms) implies that aggregate demand stimulus that increases J2J flows also raises participation — a positive feedback that is absent from models with exogenous participation.
- UI design: the model has a realistic UI system (experience-rated, finite duration). The procyclical U-to-N flow suggests that in good times, UI recipients are more likely to stop searching and exit the labour force — consistent with moral hazard effects being cyclically variable.

### 15. Overall Assessment

This is a technically accomplished paper that fills an important gap in the macro-labour literature. The empirical documentation of all six gross flow rates with careful misclassification corrections is valuable in itself. The calibration achievement — matching all six average flow rates within CIs — is a genuine methodological advance. The model's cyclical performance is reasonable but not perfect, and the paper is appropriately candid about this. The main conceptual contributions — that participation fluctuations are first-order and that intertemporal substitution operates through the job ladder even with a constant efficiency wage — are important and likely to influence subsequent work.

**Quality: Very good. Strong data work, careful calibration, novel model insights.**

### 16. Relevance to My Research

Directly relevant for RDC work on Canadian labour market flows. The framework — decomposing flows among E, U, and N — is applicable to LEED/LWF data or matched LFS data. Testing whether Canadian gross flows show the same counterintuitive cyclical patterns (procyclical $f_{UN}$, large N-adjacent flow volatility) would be a valuable paper. The calibration approach is a template for Canadian structural modelling.

### 17. Potential Research Extensions

- Implement the Krusell et al. gross flow framework for Canada using matched LFS microdata; test whether the counterintuitive $f_{UN}$ procyclicality holds in Canada and differs across provinces
- Extend the model to incorporate sectoral heterogeneity (resource vs. manufacturing vs. services), relevant for understanding how resource cycles in Canada drive differential E/U/N flows

### 18. Research Gaps

- The model does not explain *why* aggregate friction shocks are cyclical; a deeper integration with a production/vacancy-posting side would close this gap
- The paper does not address long-run trends in the participation rate (declining since 2000) — a low-frequency extension would be valuable

### 19. Methodological Lessons

1. The Abowd-Zellner correction is essential for U–N and N–U flows; misclassification errors in CPS labour force status dramatically inflate measured flows involving N.
2. Matching all six *average* flow rates (not just aggregate stocks) is a far more stringent model test than matching stocks; the model's success at all six provides strong validation.
3. Computing labour market stocks as a less stringent check when gross flows are available: even if the model passes the gross flow test, it automatically passes the stock test — but not vice versa.

---

**Five-Sentence Summary**

Krusell, Mukoyama, Rogerson, and Şahin (2017) document that gross worker flows into and out of nonparticipation are as volatile over the business cycle as the much-studied flows between employment and unemployment, and that the U-to-N transition rate is *procyclical* — counterintuitive from a discouraged-worker perspective but explained by the changing composition of the unemployment pool in booms. They build a parsimonious hybrid model combining heterogeneous-agent labour supply with search frictions, the first structural model to match all six average gross flow rates within their 95% confidence intervals. The model is driven by aggregate shocks to labour market friction parameters (job-finding and separation rates); despite a constant wage per efficiency unit, intertemporal substitution operates through the job-quality ladder, generating a procyclical incentive to participate. Flows between participation and nonparticipation account for approximately one-third of cyclical fluctuations in the unemployment rate — far larger than previously recognised. The paper establishes both empirically and theoretically that the participation margin is a first-order dimension of aggregate labour market dynamics that cannot be omitted from business cycle models of unemployment.

| | |
|---|---|
| **Key contribution** | First model to match all six steady-state E/U/N gross flow rates simultaneously; establishes the counterintuitive procyclicality of U-to-N flows; documents that the N margin accounts for ≈1/3 of unemployment fluctuations |
| **Key weakness** | Partial equilibrium only; aggregate friction shocks are taken as given rather than derived from structural fundamentals; model does not fully match all cyclical moments quantitatively |
| **Most interesting gap** | The source of cyclical variation in the friction parameters (job-finding/separation rates) is left unexplained — connecting to a production side with vacancy posting and TFP shocks would complete the model |
| **Publishable extension** | Implement the gross-flow framework for Canada using matched monthly LFS data; test whether the counterintuitive procyclical U-to-N rate holds in Canada and whether it differs between resource-intensive provinces (where participation decisions are more responsive to commodity cycles) and manufacturing provinces |

---

<a name="paper-9"></a>
## Paper 9: Carrillo-Tudela & Visschers (2023)

**Full Citation:** Carrillo-Tudela, Carlos and Ludo Visschers. "Unemployment and Endogenous Reallocation Over the Business Cycle." *Econometrica* 91(3): 1119–1153, May 2023.

---

### 1. Research Question

To what extent does the cyclicality of occupational mobility among the unemployed shape that of the aggregate unemployment rate and its duration distribution? Is cyclical unemployment driven primarily by occupation-wide productivity differences (net reallocation) or by individual workers' changing career prospects within occupations (idiosyncratic career shocks)?

### 2. Motivation

On average, 44% of unemployed workers change major occupational group (MOG) at reemployment. Occupational movers take longer to find jobs: in recessions, their average unemployment duration increases by 35% more than stayers'. Yet standard multisector models (Lucas-Prescott 1974 "islands" framework; Lilien 1982) emphasise *net* reallocation across sectors as the main driver of unemployment fluctuations, and in those models gross mobility is typically constant or countercyclical — at odds with the data. Carrillo-Tudela and Visschers document that gross occupational mobility among the unemployed is *procyclical* while net mobility is *countercyclical*, and that the dominant component is *excess mobility* (moves that cancel out at the occupation level). They build a model to explain both and show that cyclical unemployment is driven by idiosyncratic career shocks, not occupation-wide differences.

### 3. Main Contribution

1. **New empirical facts:** Using a novel classification-error correction on SIPP data (1983–2014), they document: (a) 44.5% of unemployed workers change occupation at reemployment; (b) gross mobility increases with unemployment duration; (c) gross mobility is *procyclical*; (d) net mobility is *countercyclical*; (e) excess mobility (90% of gross mobility) is procyclical and drives the procyclical pattern.

2. **A multisector business cycle model with idiosyncratic career shocks:** Workers face both occupation-wide productivity differences ($p_o$) and idiosyncratic career shocks ($z$, interpreted as "career match" quality). The model generates a separation cutoff above the reallocation cutoff — producing a "wait zone" where workers prefer to remain attached to their occupation even without a job offer.

3. **Central mechanism:** During recessions, the gap between the separation and reallocation cutoffs *widens*, causing more workers to enter the "wait zone." This generates longer unemployment spells disproportionately for occupational movers, producing the cyclically amplified duration distribution observed in the data.

4. **Key quantitative finding:** Idiosyncratic career shocks ($z$), not occupation-wide differences ($p_o$), are the dominant driver of cyclical unemployment fluctuations.

### 4. Relationship to the Literature

- Challenges the Lucas-Prescott (1974) / Lilien (1982) / Rogerson (1987) multisector framework, where *net* reallocation drives unemployment.
- Related to Alvarez-Shimer (2011) rest/search unemployment model but extends to a dynamic business cycle framework with endogenous separation decisions.
- Related to Pilossoph (2014) and Chodorow-Reich-Wieland (2020), who also find muted effects of net reallocation on unemployment, but which feature countercyclical or acyclical gross mobility — in conflict with the data.
- Kambourov-Manovskii (2008) study occupational mobility in pooled employer movers/stayers; Carrillo-Tudela-Visschers focus specifically on workers who go through unemployment.

### 5. Theoretical Framework / Economic Mechanism

**Environment:** Discrete time, mass of workers distributed over $O$ occupations. Workers differ in: idiosyncratic productivity $z_t$ (Markov, common process across occupations — "career prospects"); occupation-specific human capital $x_t$ (accumulates when employed, depreciates when unemployed). Occupation-wide productivity $p_{o,t}$ and aggregate productivity $A_t$.

**Value functions (unemployed worker in occupation $o$):**
$$W^U(\omega) = b + \beta E_{\omega'}\left[\max_{\rho(\omega')}\left\{\rho R(\omega') + (1-\rho)\left[\lambda(\theta(\omega'))W^E(\omega') + (1-\lambda(\theta(\omega')))W^U(\omega')\right]\right\}\right]$$
where $\rho$ is the reallocation decision, $R(\omega)$ is the expected value of searching across occupations, $\theta$ is market tightness in the $(z,x)$ submarket of occupation $o$.

**Separation cutoff vs. reallocation cutoff:** In each occupation, the model yields:
- **Separation cutoff** $z_s$: workers separate when $W^E(\omega) < W^U(\omega)$ — i.e., when $z < z_s$.
- **Reallocation cutoff** $z_r$: workers reallocate (switch occupation) when $R(\omega) > W^U(\omega)$ — i.e., when $z < z_r$.

The calibration finds $z_s > z_r$ within each occupation — so there is a "wait zone" $z_r < z < z_s$ where workers who separate *prefer to wait in their occupation* rather than switch, because they expect their $z$ to recover.

**Cyclical mechanism:** In recessions, $A_t$ falls → wage bill falls → both cutoffs rise. Because the separation cutoff rises *more* than the reallocation cutoff, the gap $z_s - z_r$ *widens* in recessions. More workers end up in the wait zone → more rest/wait unemployment → longer duration spells, disproportionately for movers.

**Imperfect directed search across occupations:** Workers allocate search effort across occupations $\{s_{\tilde{o}}\}$ with $\sum_{\tilde{o} \in O^-} s_{\tilde{o}} = 1$. Concavity of the matching function creates a trade-off between targeting high-quality occupations and the total probability of receiving any offer. This generates the observed excess mobility: workers move across occupations even when there is no systematic difference in occupational productivities, because idiosyncratic career prospects differ.

### 6. Data

- **Primary:** SIPP panels 1984–2008 (covering 1983–2014). Sample: workers transitioning from employment to unemployment to employment (EUE spells); excludes self-employed, armed forces, agriculture; restricts to re-employment observed ≥16 months into panel (to minimise censoring).
- **Classification error correction:** Develops a novel degarbling method using the change from independent to dependent interviewing between the 1985 and 1986 SIPP panels. Finds ~20% chance of true stayers appearing as movers under independent interviewing. Assumptions: (A1) independent classification errors; (A2) detailed balance in miscoding (symmetric miscoding); (A3) strict diagonal dominance.
- **Cross-validation:** PSID (1968–1997 occupational mobility); CPS (1979–2019 quarterly mobility series, corrected for measurement error).
- **Occupational classification:** 21 major occupational groups (2000 SOC); also task-based categories (NRC, RC, NRM, RM).
- **Calibration:** Simulated method of moments (SMM).

### 7. Empirical Strategy

1. **Classification error correction:** Constructs a degarbling matrix $\Gamma$ (O×O) with entries $\gamma_{ij}$ = probability true occupation $i$ is coded as $j$. Degarbles observed flows $M^I = \Gamma' M \Gamma$ to recover true flows $M = (\Gamma^{-1})' M^I \Gamma^{-1}$.

2. **Mobility-duration profile:** For each duration $x$, computes the fraction of workers who changed occupation among those with spells of at least $x$ months. Documents the profile, its slope, and its cyclical shift (Figure 1).

3. **Cyclicality regressions (Table I):** Regresses (log) gross mobility rate on HP-filtered unemployment rate; reports across SIPP (corrected/uncorrected), CPS, with and without controls (demographic, trend, occupation dummies).

4. **Net/excess mobility decomposition:** Separates gross mobility into net ($\frac{1}{2}\sum_i |E_{-i}UE_i - E_i UE_{-i}|/EUE$) and excess ($\frac{1}{2}\min\{E_{-i}UE_i, E_i UE_{-i}\}/EUE$). Shows excess mobility = ~90% of gross, and drives the procyclicality.

5. **Model calibration:** SMM on moments including: average gross mobility, mobility-duration profile slope, cyclicality of mobility, unemployment rate volatility, duration distribution, Beveridge curve.

### 8. Identification Strategy

**The main causal claim:** It is idiosyncratic career shocks ($z$), not occupation-wide differences ($p_o$), that drive cyclical unemployment. This is identified through model-estimated relative importance. The identification rests on:

- The fact that gross flows are an order of magnitude larger than net flows (excess mobility dominates) → occupation-wide differences cannot explain the data.
- The procyclicality of gross mobility (not net) → models emphasising countercyclical net reallocation are inconsistent with the data.
- The SMM estimates of the $z$ shock process (idiosyncratic) vs. the $p_o$ process (occupation-wide): the former is necessary to match the mobility-duration profile slope.

**Classification error correction identification:** The symmetric miscoding assumption (A2: "detailed balance") is the key identifying restriction. It is tested using the SIPP interviewing method change and shown to be approximately satisfied empirically.

### 9. Main Results

**Empirical results:**
- 44.5% of unemployed workers change MOG at reemployment (corrected for miscoding; raw: higher).
- Gross occupational mobility *increases* with unemployment duration (from 44.5% at 1 month to 54.6% at 9 months), but the increase is moderate — 40%+ of long-term unemployed still return to prior occupation.
- Gross mobility cyclicality (Table I): elasticity ≈ −0.088 to −0.145 (SIPP, varying specs) — robust procyclicality.
- Net mobility cyclicality: countercyclical (Figure 3b).
- Excess mobility accounts for ~90% of gross mobility and is the driver of procyclical gross mobility.
- The difference in average unemployment duration between movers and stayers grows from 0.4 months (expansion) to 0.9 months (recession) — a 40% contribution to overall duration increase.

**Model results:**
- The calibrated model matches: procyclical gross mobility, countercyclical net mobility, downward-sloping Beveridge curve, aggregate unemployment volatility and persistence, cyclical properties of job finding and separation rates, duration distribution.
- In recessions: rest/wait unemployment becomes relatively more prominent; in expansions: search unemployment dominates.
- Counterfactual: shutting off idiosyncratic $z$ shocks eliminates most of the cyclical variation in unemployment; shutting off occupation-wide $p_o$ differences has little effect.

### 10. Economic Magnitude and Interpretation

The mobility-duration gap (0.4 → 0.9 months from expansion to recession) represents a 40% contribution to the overall increase in average unemployment duration between expansions and recessions. This means that roughly two-fifths of the aggregate duration increase in recessions is attributable to the worsening situation of occupational movers specifically. The finding that 90% of gross mobility is excess (moves that cancel out at the occupation level) implies that the standard view of occupational reallocation in recessions — that workers are forced to leave hard-hit occupations for better ones — accounts for only a small fraction of actual occupational transitions. Most mobility is driven by individual workers' changing career prospects within their occupation.

### 11. Mechanisms

The **central mechanism** is the widening of the "wait zone" in recessions:
- When aggregate productivity $A$ falls, both the separation cutoff $z_s$ and the reallocation cutoff $z_r$ rise.
- The separation cutoff rises more, because the option value of staying in the occupation is more affected by falling wages than the option value of reallocation (which brings a fresh $z$ draw from the ergodic distribution).
- More workers have career prospects $z$ in the wait zone $(z_r, z_s)$ → they separate from their job but wait in their occupation → longer unemployment spells.
- The widening is larger for workers who are occupational movers (their option value of waiting is weaker because they need to draw a new $z$) → duration increases more for movers.

The **excess mobility mechanism:** Even without any occupation-wide differences, workers who draw low $z$ from the ergodic distribution after separation will find their current occupation undesirable and look in other occupations. Since most workers eventually draw a new $z$ (through reallocation), mobility is high but mostly cancels out at the occupation level — generating large gross but small net flows.

### 12. Robustness Checks

Extensive — relegated to Online Supplementary Material and Supplementary Appendices:
- Results hold under alternative occupational classifications (21-group SOC, task-based NRMC/RC/NRM/RM).
- Procyclicality holds using both SIPP and CPS, with and without the classification error correction.
- Mobility-duration profile robust to: demographic controls; restricting to nonemployment (not just unemployment) spells; alternative spell definitions; CPS 1979–2019.
- Model robustness: results are robust to different values of key parameters; the BRE (Block Recursive Equilibrium) structure is validated against competitive search formulation.
- Classification error correction assumptions (A1-A3) tested with PSID and CPS data.
- Repeat mobility pattern from SIPP (63.4% of stayers remain stayers; 54.4% of movers become movers again) is a non-targeted moment that the model matches.

### 13. Limitations

1. **EUE spells only:** The SIPP sample restricts to workers observed in employment → unemployment → employment. Workers who never return to employment are excluded, potentially missing the most extreme reallocation cases.
2. **2000 SOC classification:** The 21-group classification is relatively coarse; more detailed occupational classifications might reveal different patterns.
3. **Exogenous retirement:** Workers retire with fixed probability; no life-cycle dynamics.
4. **Block Recursive Equilibrium restriction:** The BRE assumption (value functions depend on $\omega_t = \{z_t, x_t, o_t, A_t, p_t\}$, not the full joint distribution) is a technical restriction needed for tractability.
5. **Wage determination:** Wages are set by Nash bargaining conditional on the current state; richer wage dynamics (wage posting, rigid wages) might alter quantitative results.
6. **US-specific:** Calibrated to US labour market; the magnitude of occupational mobility and the career shock process are US-specific.

### 14. Policy Implications

- **The dominance of idiosyncratic career shocks over occupation-wide differences** implies that policies targeting *sectoral retraining* (moving workers from dying to growing sectors) address only a small fraction of unemployment (10% of gross flows are net). The majority of occupational mobility is driven by individual career dynamics, not structural sectoral shifts.
- **The "wait zone" mechanism** implies that workers who appear to be "structural unemployed" (changing occupations) are often rationally waiting for career recovery rather than being structurally mismatched. Policy interventions that force rapid reallocation (e.g., by limiting UI duration) may be counterproductive if they push workers to accept worse occupational matches before career prospects recover.
- **Mobility and duration insurance:** The finding that occupational movers have 35% longer duration increases in recessions than stayers supports differential UI policies for occupational switchers (e.g., longer or more generous benefits during transitions).

### 15. Overall Assessment

Carrillo-Tudela and Visschers (2023) is an exceptional paper that combines careful empirical measurement (with a novel error correction methodology), a tractable theoretical model, and a rigorous quantitative calibration. The main empirical fact — procyclical gross mobility, countercyclical net mobility, excess mobility dominates — overturns a widely held prior and motivates a new theory of cyclical unemployment. The model's success in simultaneously matching this complex pattern of occupational mobility and the cyclical properties of unemployment duration is impressive. The paper is dense and technically demanding (35 pages, extensive supplementary appendices) but the payoff in terms of novel insights is large.

**Quality: Outstanding. A landmark contribution to the literature on occupational mobility, unemployment dynamics, and business cycles.**

### 16. Relevance to My Research

Highly relevant for RDC work on labour market dynamics. Canadian administrative data (LEED, LEAP) potentially allows measurement of occupational mobility among the unemployed, testing whether the procyclical gross / countercyclical net mobility finding holds in Canada. The model's mechanism — widening wait zones in recessions — has direct implications for resource-sector workers in Canada: during commodity price busts, resource workers who separate face a particularly stark wait-or-switch decision, potentially generating unusually long unemployment spells.

### 17. Potential Research Extensions

- Test the mobility-duration profile and its cyclicality for Canada using LWF/LEED data; does 44% of Canadian unemployed change occupation at reemployment?
- Study whether the "wait zone" mechanism is more pronounced in resource provinces where occupation-specific human capital is highly concentrated

### 18. Research Gaps

- The paper does not model long-run secular changes in occupational mobility (automation, polarisation). The excess mobility mechanism might interact with technological change in ways not addressed here.
- Workers' subjective career expectations (the $z$ process) are modelled as exogenous Markov — allowing firms' actions (R&D, capital investment) to endogenously affect career prospects would enrich the model.

### 19. Methodological Lessons

1. The classification error correction matrix $\Gamma$ — identified from the SIPP interviewing method change — is a powerful tool for obtaining unbiased measures of occupational mobility from administrative/survey data. The "detailed balance" assumption (A2) is the key testable restriction.
2. Decomposing gross mobility into net and excess components is essential: the dominant component (excess, 90%) has completely different cyclical properties from net mobility, and aggregating them masks the key empirical patterns.
3. Block Recursive Equilibrium (BRE) is an effective approach to tractability in rich multisector models with heterogeneous agents — it rules out the joint productivity distribution as a state variable while preserving the full richness of individual-level heterogeneity.

---

**Five-Sentence Summary**

Carrillo-Tudela and Visschers (2023) document, using SIPP data with a novel miscoding correction, that 44% of unemployed U.S. workers change major occupational group at reemployment, gross occupational mobility among the unemployed is *procyclical*, net mobility is *countercyclical*, and 90% of gross mobility is excess mobility (moves that cancel out at the occupation level) — patterns inconsistent with standard multisector models. They develop a multisector business cycle model with idiosyncratic career shocks ($z$), occupation-specific human capital, and DMP matching frictions; the key equilibrium feature is that within each occupation, the separation cutoff exceeds the reallocation cutoff, creating a "wait zone" where separated workers prefer to remain attached to their occupation. In recessions, aggregate productivity falls, the wait zone widens endogenously, more workers enter rest/wait unemployment, and duration spells lengthen disproportionately for occupational movers — generating the observed 35% larger duration increase for movers than stayers in downturns. The model is calibrated by SMM and quantitatively matches the mobility-duration profile, procyclical gross mobility, countercyclical net mobility, unemployment volatility, and the Beveridge curve simultaneously. The core finding is that cyclical unemployment is driven by workers' changing idiosyncratic career prospects, not by occupation-wide differences — implying that standard sectoral retraining policies address only a small fraction of the unemployment dynamics operating through the labour market.

| | |
|---|---|
| **Key contribution** | First model to simultaneously reproduce procyclical gross and countercyclical net occupational mobility among the unemployed; shows idiosyncratic career shocks (not occupation-wide differences) drive cyclical unemployment through an endogenous "wait zone" mechanism |
| **Key weakness** | EUE spells only (non-returners excluded); BRE restriction for tractability; exogenous wage determination; no life-cycle dynamics |
| **Most interesting gap** | The interaction between automation/polarisation trends and the excess mobility mechanism: if technological change is destroying career prospects within occupations, the wait zone should be wider and cyclical amplification larger |
| **Publishable extension** | Test the mobility-duration profile and its cyclicality for Canada using LEED/LWF data; study whether resource-sector workers (high occupation-specific human capital) exhibit stronger wait-zone behaviour during commodity busts than service-sector workers |

---

<a name="paper-10"></a>
## Paper 10: Asplund & Nocke (2006)

**Full Citation:** Asplund, Marcus and Volker Nocke. "Firm Turnover in Imperfectly Competitive Markets." *Review of Economic Studies* 73(2): 295–327, 2006.

---

### 1. Research Question

How do market size and fixed costs determine firm turnover (entry and exit rates) and the age distribution of firms in imperfectly competitive markets? Does the price-competition effect generated by larger markets systematically accelerate firm turnover by raising the exit threshold?

### 2. Motivation

Industries differ substantially in their levels of firm turnover, and entry and exit rates are highly positively correlated across industries (Dunne, Roberts, Samuelson 1988). Existing theory (primarily Hopenhayn 1992) explains this in perfectly competitive markets: entry costs and fixed costs affect turnover by changing the exit threshold. However, in perfectly competitive models, market size has *no effect* on firm turnover because the entry cost is independent of the number of firms. In imperfectly competitive industries — where competition becomes more intense as more firms enter — there is an additional mechanism: larger markets → more firms → lower price-cost margins → higher exit threshold → faster turnover. Asplund and Nocke formalise and test this *price-competition effect*.

### 3. Main Contribution

1. **Theoretical:** Develops a stochastic dynamic model of a monopolistically competitive industry and shows (under Assumptions 1–2: price effect) that firm turnover is *increasing in market size*. This is a novel prediction unavailable from Hopenhayn's competitive benchmark.

2. **Empirical:** Tests the prediction using data on hair salons in Sweden across geographic markets of different sizes. Using non-parametric FOSD tests and regressions on the age distribution of firms, confirms that firms are younger in larger markets and in markets with higher fixed costs.

3. **Comparative dynamics:** Derives the full set of comparative dynamics results: entry cost increases → lower turnover; fixed cost increases → higher turnover (under U.2/separability); market size increases → higher turnover (via price competition effect); these results require Assumptions 1 and 2 to hold.

### 4. Relationship to the Literature

- Extends Hopenhayn (1992): same basic stochastic firm dynamics structure but with monopolistic competition instead of perfect competition. The price-competition effect is absent in Hopenhayn.
- Extends the Dixit-Stiglitz model: but Dixit-Stiglitz does not satisfy Assumption 2 (no price competition effect in constant-markup equilibria). Standard Cournot and linear demand models do satisfy Assumptions 1 and 2.
- Related to Melitz (2003) on trade with heterogeneous firms: Melitz uses Hopenhayn-type entry/exit in a two-country Dixit-Stiglitz setting, but there is no price-competition effect and turnover is independent of market size.
- Provides empirical predictions that cross-industry tests cannot: by using geographic variation within a single industry (hair salons), eliminates unobservable cross-industry differences in shock volatility.

### 5. Theoretical Framework / Economic Mechanism

**Model structure:** Discrete time, infinite horizon. Firm efficiency $c \in [0,1]$ (lower $c$ = more efficient). Efficiency evolves as a mixture process: with probability $\alpha$, efficiency stays the same; with probability $1-\alpha$, the firm draws a new efficiency from $G(\cdot)$. Sunk entry cost $\varepsilon > 0$; fixed per-period production cost $\phi > 0$.

**Reduced-form profit function:** $S\pi(c; \mu) \geq 0$, where $S$ is market size, $\mu$ is the measure of active firms. Assumptions:
- (MON): $\pi(\cdot; \mu)$ strictly decreasing in $c$ on $[0, c(\mu))$; zero for $c \geq c(\mu)$.
- (DOM): First-order stochastic dominance of firm distributions is preserved by the profit ordering.
- (ORD): The ordering $(M, \succeq)$ is complete.
- (CON): $\pi(c; \mu)$ is continuous.
- **Assumption 1 (market share effect):** For $\mu' \succ \mu$, the profit *difference* $\pi(c;\mu) - \pi(c;\mu')$ is strictly decreasing in $c$.
- **Assumption 2 (price competition effect):** For $\mu' \succ \mu$, the profit *ratio* $\pi(c;\mu')/\pi(c;\mu)$ is strictly decreasing in $c$.

Assumption 2 is the key new assumption: it says that when competition intensifies, the percentage decrease in profits is *larger* for inefficient firms. This holds for standard Cournot models and linear demand models, but fails for Dixit-Stiglitz (constant markup).

**Stationary equilibrium value function:**
$$V(c) = \max\{0, \bar{V}(c)\}, \quad \bar{V}(c) = [S\pi(c;\mu) - \phi] + \delta\left[\alpha V(c) + (1-\alpha)\int_0^1 V(z)\,G(dz)\right]$$

**Exit rule:** Threshold $c^*$: exit if and only if $c > c^*$.

**Entry and exit conditions:**
- (E): $\int_0^{c^*}[S\pi(c;\mu) - \phi + \delta(1-\alpha)\varepsilon]G(dc) = (1-\alpha\delta)\varepsilon$ (free entry)
- (X): $S\pi(c^*;\mu) - \phi + \delta(1-\alpha)\varepsilon = 0$ (optimal exit)

**Central comparative dynamics result (Proposition 4):** Under Assumption 2, an increase in market size $S$ raises the exit threshold $c^*$, increases firm turnover, and shifts the age distribution of firms toward younger firms in the sense of first-order stochastic dominance.

**Mechanism:** Larger $S$ → more firms enter → price-cost margins fall for all firms → the percentage decline is larger for *inefficient* (high $c$) firms (Assumption 2) → their value falls below the exit threshold → they exit → the marginal surviving firm must be more efficient → $c^*$ decreases → faster turnover → shorter firm lifespan.

### 6. Data

- **Swedish hair salons (1993–2001):** Age distribution of hair salons across Swedish municipalities of varying population sizes (market size = population).
- **Advantages of this setting:** (i) Within a single industry, the key unobservable (volatility of common shocks) is held approximately constant across geographic markets. (ii) Markets are geographically local and mostly non-overlapping. (iii) Fixed costs are captured by observable characteristics of different municipalities.
- **Dependent variable:** Age distribution of active hair salons in each municipality (years in operation).
- **Tests:** Non-parametric tests of first-order stochastic dominance (FOSD) of age distributions across markets of different sizes; OLS and quantile regressions of firm age on market size and fixed cost proxies.

### 7. Empirical Strategy

1. **Conceptual motivation:** The theory predicts that larger markets have younger age distributions of firms. FOSD tests provide a non-parametric test of this prediction.

2. **FOSD tests:** For pairs of municipalities of different sizes, test whether the CDF of firm ages in the larger market is above (in the sense of younger) the CDF in the smaller market.

3. **Regression analysis:** Regress firm age on market size (log population) and fixed cost proxies (market-specific observable costs), controlling for local demand characteristics.

4. **Fixed cost variation:** Uses municipality-specific variation in observable fixed costs (rent levels, regulatory compliance costs) to test Proposition 5 — that higher fixed costs shift the age distribution toward younger firms.

### 8. Identification Strategy

The key identifying variation is *within-industry, cross-market variation in market size and fixed costs*. This is the paper's main methodological innovation: by studying a single industry (hair salons) across many geographically distinct local markets, the authors avoid the primary confound in cross-industry tests (cross-industry variation in shock volatility). Firms in different local markets face the same technology, similar consumer preferences, and the same industry-level shocks, but different market sizes. The identifying assumption is that local market size is exogenous to the age distribution of hair salons — i.e., market size is determined by population rather than by firm dynamics.

**Limitation:** No instrumental variable for market size; the OLS estimate of the market size coefficient may reflect reverse causality if industries with younger firms attract more consumers.

### 9. Main Results

**Theoretical:**
- **Proposition 3 (entry cost):** Higher entry cost $\varepsilon$ → lower $c^*$ → lower turnover. (Same as Hopenhayn 1992.)
- **Proposition 4 (market size):** Larger $S$ → higher $c^*$ → higher turnover → age distribution is FOSD-dominated by smaller markets. (New result.)
- **Proposition 5 (fixed cost):** Under Assumption 2, higher $\phi$ → higher $c^*$ → higher turnover. (New result; direction is opposite in Hopenhayn under some conditions.)

**Empirical (hair salons):**
- Non-parametric FOSD tests confirm: the age distribution in larger markets is stochastically first-order dominated by that in smaller markets — firms are systematically younger in larger markets.
- OLS regressions confirm: log market size has a negative and statistically significant coefficient on firm age.
- Higher fixed cost proxies: associated with younger firms, as predicted by Proposition 5.
- Quantile regressions show the effect is not confined to young or old firms but pervasive across the age distribution.

### 10. Economic Magnitude and Interpretation

The paper provides compelling evidence that market size is a first-order determinant of firm turnover. The regression results show that an increase in market size of one standard deviation is associated with a meaningful reduction in average firm age. While the exact magnitudes are not the focus (this is primarily a theory paper with an illustrative empirical test), the consistency of the direction across parametric and non-parametric tests, and the clarity of the FOSD stochastic dominance result, provide strong support for the central mechanism.

The finding that fixed costs are associated with *younger* firms (more turnover, shorter lifespans) is particularly noteworthy: it implies that regulations or compliance costs that raise the per-period cost of operating a business do not necessarily reduce dynamism — they can *increase* turnover by making it harder for low-productivity incumbents to survive.

### 11. Mechanisms

The price-competition effect operates as follows:
1. Larger market → free entry drives in more firms → price-cost margins fall for all active firms.
2. Assumption 2 (price effect of competition): the *percentage* decline in profits is larger for less efficient (higher marginal cost) firms than for efficient ones. This is because price falls are proportionally more damaging when gross profit margins are already thin (as for high-cost firms).
3. High-cost incumbents cross the exit threshold first → they exit.
4. The marginal surviving firm must be more efficient ($c^*$ decreases).
5. More efficient survivors generate smaller expected lifetimes for any given entrant → higher firm turnover.
6. The resulting age distribution is shifted toward younger firms (FOSD).

The **option value mechanism** at the exit threshold: a firm with $c = c^*$ has negative current net profit ($S\pi(c^*;\mu) - \phi < 0$) but stays in the market because of the option value of getting a new, potentially better efficiency draw: $\delta(1-\alpha)\varepsilon$. This is formally equivalent to Hopenhayn's exit condition but now embedded in an imperfectly competitive equilibrium.

### 12. Robustness Checks

- Main predictions tested under Cournot competition with homogeneous goods (Appendix) — shows Assumptions 1 and 2 hold in this canonical setting.
- Results shown to hold for the linear demand model with perceived quality differences (Example 2) — isomorphic representation.
- FOSD tests are non-parametric — do not rely on any distributional assumptions.
- Quantile regressions show results are not driven by outliers at the top or bottom of the age distribution.
- Robustness to alternative fixed cost proxies.
- The paper acknowledges that the Dixit-Stiglitz model fails Assumption 2 (no price competition effect) and discusses why — this is an important limitation of the widely-used Melitz (2003) framework for trade.

### 13. Limitations

1. **No IV for market size:** The OLS estimate of the market size effect may be biased if, e.g., cities with more dynamic economies attract faster-growing service industries.
2. **Single industry:** Hair salons are a low-tech, labour-intensive sector. Generalisability to high-tech or manufacturing sectors (where capital costs dominate) is unclear.
3. **Dixit-Stiglitz incompatibility:** The most widely used model of monopolistic competition (Melitz 2003) does not satisfy Assumption 2, limiting the model's applicability to trade contexts as typically modelled.
4. **Static heterogeneity measure:** Efficiency $c$ follows a stylised mixture process ($\alpha, 1-\alpha$ draws from $G$); this abstracts from more realistic Markov processes for firm productivity.
5. **No dynamic entry:** Potential entrants decide to enter before knowing their efficiency type — this is standard but rules out the possibility that high-quality potential entrants selectively enter large markets.

### 14. Policy Implications

- **Entry regulation:** Consistent with Hopenhayn (1992), reducing entry costs (cutting red tape) increases turnover and the efficiency of the active firm distribution.
- **Fixed production costs:** Higher fixed costs (from regulations, compliance requirements, minimum employment mandates) increase firm turnover and shift age distributions toward younger, more efficient firms — a counterintuitive policy implication.
- **Economic integration:** Larger integrated markets (e.g., EU integration, free trade areas) generate more intense price competition, raise exit thresholds, and accelerate turnover — improving aggregate productivity but at the cost of incumbent firm stability.
- **Local market structure:** Municipalities or regions that facilitate market size growth (through agglomeration, better infrastructure, reduced barriers to consumer entry) will, according to the theory, enjoy more dynamic and productive firm populations.

### 15. Overall Assessment

Asplund and Nocke (2006) is an elegant paper that cleanly identifies a new mechanism (the price competition effect) not present in Hopenhayn's competitive benchmark and provides an internally consistent theory and empirical test. The theoretical contribution is solid and the empirical design — using geographic variation within a single industry — is imaginative and appropriate. The paper's main weakness is the lack of a causal identification strategy for market size and the restriction to a single low-tech industry. The finding that Dixit-Stiglitz (the most widely used imperfect competition model in trade) does not generate the price competition effect is an important limitation, suggesting that results may not carry over to Melitz-type trade models.

**Quality: Good. A clean theoretical contribution with an appropriate empirical illustration, but limited by narrow empirical scope.**

### 16. Relevance to My Research

Relevant for research on firm dynamics in Canada at the RDC. The framework provides testable predictions about how local market size affects firm turnover rates across Canadian cities and towns. Using LEAP or T2 corporate tax data, one could test whether firm turnover is higher in larger metropolitan areas (Toronto vs. Prince George), controlling for industry. The fixed-cost prediction (more turnover in markets with higher compliance costs) is testable against provincial variation in business regulation.

### 17. Potential Research Extensions

- Test the market size → firm turnover prediction for Canadian service industries (e.g., restaurants, retail) using LEAP/LEED data across municipalities of different sizes; compare to manufacturing
- Examine whether economic integration (CETA, CPTPP) increased firm turnover in Canadian import-competing industries, consistent with the market size mechanism

### 18. Research Gaps

- The paper does not study the *aggregate productivity* consequences of the price-competition-driven turnover increase (Foster, Haltiwanger, Krizan 2001 decomposition would be natural)
- The model has no worker side — the welfare effects of higher firm turnover on workers (displacement, wage changes) are outside the model

### 19. Methodological Lessons

1. Testing theory predictions within a *single industry* across geographic markets of varying sizes is a powerful design that eliminates the main confound (cross-industry shock volatility) in cross-industry tests.
2. Non-parametric FOSD tests of age distributions provide a model-free test of the theory's stochastic dominance predictions and are more convincing than tests based on a single summary statistic (mean age).
3. The distinction between Assumptions 1 (market share effect) and 2 (price competition effect) allows different models of competition (Cournot, Bertrand, Dixit-Stiglitz) to be compared on a common basis — a useful model taxonomy.

---

**Five-Sentence Summary**

Asplund and Nocke (2006) develop a stochastic dynamic model of a monopolistically competitive industry and show that firm turnover is increasing in market size through a price-competition effect: larger markets support more firms, which intensifies price competition, and the percentage profit reduction is larger for less efficient (higher-cost) firms, raising the exit threshold and accelerating turnover. This prediction — absent from Hopenhayn's (1992) competitive benchmark and inconsistent with the widely used Dixit-Stiglitz model — is tested using data on Swedish hair salons across municipalities of varying sizes, where variation in market size is plausibly unrelated to variation in common shock volatility. Non-parametric FOSD tests and OLS regressions confirm that larger markets have age distributions shifted toward younger firms, and markets with higher fixed costs (Proposition 5) similarly have younger firms. The model also delivers clean comparative dynamics results: higher entry costs reduce turnover by protecting incumbents, while higher fixed production costs increase turnover through a selection effect. The paper establishes that market size is a first-order determinant of firm dynamics that cannot be captured by competitive industry models, with important implications for policies affecting market structure and economic integration.

| | |
|---|---|
| **Key contribution** | Novel theoretical prediction that firm turnover is increasing in market size under imperfect competition (price-competition effect); first paper to embed this in a stochastic dynamic equilibrium and test it empirically |
| **Key weakness** | No IV for market size (potential reverse causality); limited to single low-tech industry (hair salons in Sweden); central result does not hold under Dixit-Stiglitz (most common trade model) |
| **Most interesting gap** | The aggregate productivity implications of the market-size-driven turnover increase are not quantified; a Foster-Haltiwanger-Krizan (2001) decomposition of productivity growth in markets of different sizes would complete the welfare analysis |
| **Publishable extension** | Test the Asplund-Nocke market size → firm turnover prediction for Canadian service industries using LEAP data across Census Metropolitan Areas of different sizes; study whether CETA/CPTPP increased turnover in import-competing industries through the price-competition channel |
