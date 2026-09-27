# Paper Summaries — Batch 01

**Papers processed:** First 5 papers from `papers_to_read_index.md` (Group A: Measurement Foundations)  
**Date:** 2026-09-13  
**Summarized by:** Claude Code (claude-sonnet-4-6), acting as senior academic economist  
**No original files were modified.**

---

## Table of Contents

1. [Davis & Haltiwanger (1992), QJE](#paper-1)
2. [Hopenhayn (1992), Econometrica](#paper-2)
3. [Campbell & Fisher (2000), AER](#paper-3)
4. [Davis & Haltiwanger (1999), AER](#paper-4)
5. [Lazear & Spletzer (2012), AER P&P](#paper-5)

---

<a name="paper-1"></a>
## Paper 1: Davis & Haltiwanger (1992)

**Full Citation:** Davis, Steven J. and John Haltiwanger. "Gross Job Creation, Gross Job Destruction, and Employment Reallocation." *Quarterly Journal of Economics* 107(3): 819–863, August 1992.

---

### 1. Research Question

What is the magnitude and structure of gross job creation and destruction in U.S. manufacturing, how does job reallocation relate to worker reallocation, and what accounts for simultaneous job creation and destruction within narrowly defined sectors of the economy?

### 2. Motivation

Prior to this paper, macroeconomics focused almost exclusively on net employment changes, treating aggregate employment as if it reflected homogeneous expansions and contractions across the economy. The large gross worker flows documented in the CPS literature (Clark-Summers, Abowd-Zellner) remained unexplained in structural terms. It was unclear whether large worker flows reflected temporary layoffs and recalls across a fixed set of jobs — a reassortment phenomenon — or rather reflected genuine destruction and creation of employment opportunities. The answer matters: if most worker mobility is driven by job reallocation (creation and destruction of positions), then the character, timing, and cost of unemployment are very different from a world where workers simply shuffle across stable jobs. The paper addresses this gap by constructing the first comprehensive, plant-level longitudinal estimates of gross job flows in a major sector of the U.S. economy.

### 3. Main Contribution

The paper makes four major contributions:

1. **Measurement:** Constructs the DH gross job flow framework — the definitions of POS (job creation), NEG (job destruction), SUM (job reallocation), and the Davis-Haltiwanger growth rate measure `g = ΔE / [(E_t + E_{t-1})/2]` — which became the field standard. Shows that U.S. manufacturing averaged 9.2% job creation and 11.3% job destruction per year (1972–1986).

2. **Job-worker reallocation link:** Demonstrates that 35–56% of all worker reallocation between employment states is directly driven by job reallocation, establishing that shifts in the distribution of employment opportunities across plants are a dominant source of worker mobility.

3. **Persistence and concentration:** Establishes that job creation and destruction are largely *persistent* (one-year persistence rates: 68% for creation, 81% for destruction) and *concentrated* (77% of job destruction comes from plants shrinking by more than 20%), ruling out temporary layoff/recall as the dominant mechanism.

4. **Cross-sectional heterogeneity:** Documents systematic variation in job reallocation by plant age, size, ownership type, and region — with young plants having reallocation rates 3× those of mature plants — and shows that between-sector shifts account for essentially none (~12% at the four-digit industry level) of excess job reallocation, compelling a within-sector, plant-level explanation.

### 4. Relationship to the Literature

The paper sits at the intersection of three literatures: (i) gross worker flows (Clark-Summers 1979; Hall 1982; Blanchard-Diamond 1990); (ii) firm/plant-level employment dynamics (Jovanovic 1982; Evans 1987; Dunne, Roberts, Samuelson 1989); and (iii) macroeconomic business-cycle theory (Caballero 1990; Davis-Haltiwanger 1990). The paper critiques and extends each. Prior to DH1992, only Leonard (1987) and Dunne, Roberts, Samuelson (1989) had measured gross job flows at the plant level, but with less frequency, shorter samples, and narrower coverage. The paper also directly motivates Hopenhayn (1992) and much of the ensuing structural literature on firm dynamics.

### 5. Theoretical Framework / Economic Mechanism

The paper is primarily measurement-oriented rather than theory-driven. The conceptual apparatus rests on three mechanisms proposed in the literature to explain simultaneous job creation and destruction:

- **Passive learning and selection** (Jovanovic 1982): Firms gradually learn their efficiency type; those discovering unfavorable types exit (job destruction) while survivors grow (job creation). This predicts declining job reallocation with age.
- **Active learning / technological vintage** (Ericson-Pakes 1989): Stochastic investment outcomes generate ongoing idiosyncratic uncertainty, sustaining perpetual entry and exit.
- **Idiosyncratic cost/demand disturbances** (Hopenhayn 1989; Davis-Haltiwanger 1990): Even homogeneous plants within sectors face idiosyncratic shocks to local costs (energy, taxes) or local demand, driving simultaneous expansion and contraction.

The mathematical framework defines the growth rate of establishment `e` at time `t` as:
```
g_et = (E_et - E_{e,t-1}) / [(E_et + E_{e,t-1})/2]
```
which lies in [−2, 2] and symmetrically handles births (g = 2) and deaths (g = −2). Job creation and destruction rates for sector `s` at time `t` are:
```
POS_st = Σ_{e∈E_st, g_et>0} (x_et/X_st) · g_et
NEG_st = Σ_{e∈E_st, g_et<0} (x_et/X_st) · |g_et|
SUM_st = POS_st + NEG_st
```
where `x_et` is size and `X_st` is sector size. SUM (excess + minimum reallocation needed) and MAX = max(POS, NEG) bound the required worker reallocation from below and above.

### 6. Data

- **Dataset:** Longitudinal Research Datafile (LRD) from the U.S. Census Bureau
- **Coverage:** All manufacturing establishments with 5+ employees sampled in the Annual Survey of Manufactures (ASM)
- **Sample size:** ~860,000 annual observations; ~160,000 manufacturing establishments; 11 years (1972–1986, excluding 1974, 1979, 1984 due to ASM panel break-years)
- **Strengths:** Probability-based sample; births incorporated into ongoing panels; careful distinction between ownership transfers and actual births/deaths; certainty stratum covers ~2/3 of manufacturing employment (250+ employees)
- **Limitations:** Five-year panel structure means non-certainty establishments (small plants) are harder to track across panel boundaries; point-in-time employment (March) understates true flows

### 7. Empirical Strategy

Pure descriptive measurement. The strategy involves:
- Computing annual POS, NEG, SUM, MAX at the establishment level and aggregating using employment shares as weights
- Tabulating persistence: what fraction of jobs created (destroyed) in year `t` remain created (destroyed) in year `t+1` and year `t+2`
- Cross-tabulating gross flow rates by industry, size class, age group, ownership type, and geographic region
- Bounding worker reallocation required by job reallocation (SUM as upper bound; MAX as lower bound) and comparing against total worker reallocation from the CPS

### 8. Identification Strategy

**This is a descriptive paper with no causal identification.** The approach is measurement and decomposition. The authors explicitly acknowledge that the paper documents facts rather than establishing causal mechanisms. For the passive-learning exercise, they use an indirect decomposition: they assume that plants older than some age `T*` have fully resolved their initial uncertainty, so that job reallocation for age `T*+` plants represents the "irreducible" long-run rate. The excess reallocation for younger plants relative to this benchmark is attributed to learning. This requires the identifying assumption that: (i) within-industry, long-run job reallocation rates are stable across age cohorts for old plants; (ii) the excess reallocation of young plants is not driven by other factors (e.g., higher exposure to idiosyncratic shocks that diminish with age for non-learning reasons). Both are contestable, but the paper makes its assumptions explicit.

### 9. Main Results

**Core measurement facts (Table I):**
- Average annual gross job creation: 9.2% of employment
- Average annual gross job destruction: 11.3% of employment
- Average annual job reallocation: 20.5% of employment
- Every year shows both creation and destruction rates exceeding 6% — even in 1975, a catastrophic recession year, gross job creation was 7%
- Strong negative correlation between creation and net employment: ρ(POS, NEG) = −0.864; ρ(NET, SUM) = −0.565

**Cross-industry variation (Table II):**
- Job reallocation ranges from 14.0% (Tobacco) to 28.8% (Lumber) across 2-digit industries
- Within every 2-digit industry, simultaneous creation and destruction (excess reallocation) is large

**Persistence (Table III):**
- One-year persistence: 68% for creation, 81% for destruction
- Two-year persistence: 50% for creation, 73% for destruction
- Highest persistence for destruction in 1980–81 downturn (88% one-year)

**Cross-section by plant characteristics (Table IV):**
- Job reallocation declines sharply with age: 48% at age 1, 26% at age 3, 16% for plants 15+ years old
- Job reallocation declines sharply with size: 30% for 1–99 employees, 14% for 1000+ employees
- Single-unit plants: 28% reallocation rate; multi-unit plants: 18%

**Job-worker reallocation link:**
- Total worker reallocation: ~36.8% of employment annually (CPS-based)
- Job reallocation accounts for 35–56% of total worker reallocation
- Job reallocation is thus the dominant driver of worker mobility

**Countercyclical reallocation:**
- ρ(NET, SUM) = −0.57 over the sample
- Reallocation ranges from 17.3% (1980) to 23.3% (1975 and 1983)

### 10. Economic Magnitude and Interpretation

The magnitude of findings is striking. In an average year, employment positions equivalent to one-fifth of the manufacturing workforce are either newly created or newly destroyed. Even in boom years, gross job destruction exceeds 6%. The 35–56% share of worker reallocation attributable to job reallocation implies that the labor market does not simply shuffle workers around a fixed set of jobs — it fundamentally reshapes the distribution of employment opportunities. The persistence results (68–81% one-year) imply that most job creation and destruction is not transitory: it represents real, durable changes in the employer's workforce level. The concentration result — that 77% of job destruction comes from plants shrinking by more than 20% — means most job losses cannot be absorbed by normal attrition and require actual layoffs. These magnitudes establish that standard representative-agent macro models, which focus entirely on net employment, are ignoring enormous amounts of economically meaningful labor market activity.

### 11. Mechanisms

The paper evaluates four potential explanations for why creation and destruction occur simultaneously within narrowly defined sectors:

1. **Between-sector employment shifts:** Even at the 4-digit industry level (450 industries), between-sector shifts account for only ~12% of excess job reallocation. This definitively rules out sectoral-shock explanations.

2. **Passive learning about initial conditions:** The counterfactual exercise attributes 11–13% of total job reallocation to learning-related effects. However, learning explains one-third to one-half of *variation* in reallocation rates across age, size, and ownership groups — suggesting learning amplifies other disturbances rather than generating reallocation independently.

3. **Plant-level idiosyncratic disturbances:** By elimination, the dominant mechanism must be ongoing plant-level idiosyncratic shocks — whether to costs, demand, or technology — that are orthogonal across plants even within the same 4-digit industry.

4. **Countercyclical reallocation:** The data compel the inference that job reallocation varies countercyclically, primarily through time variation in the *magnitude* of idiosyncratic plant-level shocks, not through compositional shifts across sectors. The cyclical patterns are most pronounced in older, larger, multi-unit plants — plants that are not subject to strong learning effects — suggesting that aggregate conditions interact with the pace of idiosyncratic disturbances.

### 12. Robustness Checks

The paper is primarily descriptive, so classical robustness checks are limited. The authors check:
- Consistency of their gross flow measures with LRD-period BLS Business Employment Dynamics data
- Consistency of CPS-based gross worker flow adjustments (using both Abowd-Zellner and Poterba-Summers error matrices)
- Results hold across multiple base years for persistence calculations
- Cross-industry variation results replicated across individual years

**Key data limitation acknowledged:** Because the LRD excludes establishments with fewer than 5 employees, the job reallocation estimates are lower bounds. Leonard (1987) finds that nonmanufacturing reallocation is ~28% higher than manufacturing, suggesting that economy-wide reallocation substantially exceeds the manufacturing estimates.

### 13. Limitations

1. **Sector coverage:** Confined to U.S. manufacturing, which was already shrinking and may not be representative of the economy. Service sectors, with different dynamics, are excluded.
2. **Annual frequency:** March-to-March data miss intrayear job creation and destruction; the reported annual flows understate true quarterly or monthly flows.
3. **Point-in-time employment stock:** Measures lower bounds on true gross flows because employment at a single survey date cannot capture within-year cycles.
4. **No causal identification:** The paper establishes regularities but cannot explain *why* reallocation is countercyclical or why it varies systematically with plant age.
5. **Learning decomposition is fragile:** The counterfactual exercise requires identifying assumptions (that reallocation stabilizes at the long-run level by some age threshold) that are difficult to validate.

### 14. Policy Implications

- High rates of job reallocation imply that unemployment is typically a structural transition phenomenon, not merely a cyclical fluctuation in the aggregate demand for labor. Policies that support worker transitions (training, job search assistance) are more relevant than aggregate demand stimulus.
- The countercyclical nature of job reallocation implies that recessions accelerate necessary reallocations. "Recession as cleansing" policies — avoiding bailouts that would preserve misallocated resources — find direct empirical grounding here.
- Firing-cost regulations designed to reduce job destruction would, according to the model, reduce both creation and reallocation, potentially lowering long-run productivity.
- The large fraction of young, small plants in total reallocation suggests that policies affecting entry costs (regulations, administrative burdens) have first-order effects on the efficiency of resource allocation.

### 15. Overall Assessment

This is a landmark empirical paper that created a field. The DH gross job flow framework is now used worldwide, the LRD-based estimates have been replicated and extended to dozens of countries and sectors, and the conceptual apparatus (creation/destruction/reallocation) is the standard language of labour economics and macroeconomics. The paper's weaknesses are primarily a function of when it was written: panel coverage of small plants was limited, service sectors were excluded, and causal identification was not pursued. The paper does not attempt to distinguish whether countercyclical reallocation is efficient ("cleansing") or inefficient ("sullying"), a distinction that would motivate a decade of subsequent theoretical work.

**Quality: Exceptional. A required reading for anyone working on labour dynamics, firm dynamics, or macroeconomic fluctuations.**

### 16. Relevance to My Research

Directly foundational for RDC-based research on job flows in Canada. The methodology (plant-level longitudinal data, decomposition of gross flows by plant characteristics) is exactly the approach applicable to LEAP (Longitudinal Employment Analysis Program) or LEED (Longitudinal Worker File) data in Canada. The key measurements — job creation, destruction, and reallocation rates by age, size, industry, and region — would be directly replicable with Canadian data and would reveal whether the magnitudes and patterns found in U.S. manufacturing generalize to the Canadian context, including the resource-sector-heavy Western provinces.

### 17. Potential Research Extensions

- Replicate the DH framework for Canadian manufacturing and services using LEAP/LEED data; test whether Canadian job reallocation is higher or lower than U.S., particularly around resource price cycles
- Compare job reallocation dynamics before and after major trade liberalizations (FTA 1989, NAFTA 1994, CETA)
- Examine whether countercyclical job reallocation intensified during the 2008–09 recession and COVID-19 in Canada
- Extend to services and public sector in Canada — sectors excluded from DH1992

### 18. Research Gaps

- **Causal mechanism:** DH1992 documents the facts but does not identify whether countercyclical reallocation is efficient or not, or what precisely drives the idiosyncratic plant-level shocks.
- **Geography:** The paper uses Census regions but does not exploit within-region or local labour market variation in reallocation.
- **Worker outcomes:** Job destruction rates tell us about positions, not about workers. What happens to the workers displaced from destroyed jobs — wage effects, duration of nonemployment, occupational switching — is entirely outside the scope.
- **Service sector:** U.S. nonmanufacturing dynamics were unmeasured at plant level in 1992 and remain underexplored.

### 19. Methodological Lessons

1. The DH growth rate measure `g_et = ΔE/average(E)` is superior to the conventional log-difference because it handles births and deaths symmetrically and is bounded, enabling integration of entry/exit with continuing establishments in a single framework.
2. Constructing persistence measures (what fraction of newly created jobs still exist one or two years later) is essential for distinguishing transitory from permanent employment changes.
3. Bounding worker reallocation from above (SUM) and below (MAX) is a simple and powerful diagnostic for the connection between job and worker flows.
4. Weighting establishment-level growth rate observations by employment share (rather than equally) is critical for ensuring that aggregate implications reflect the behavior of large employers.

---

### Five-Sentence Summary

Davis and Haltiwanger (1992) use the U.S. Census Bureau's Longitudinal Research Datafile to document, for the first time comprehensively, that gross job creation and destruction in U.S. manufacturing averaged 9.2% and 11.3% of employment per year over 1972–1986 — flows an order of magnitude larger than net employment changes. They show that job reallocation is persistent (68–81% one-year persistence), concentrated (77% of destruction from plants shrinking >20%), and accounts for 35–56% of all worker reallocation, establishing that shifts in the distribution of employment opportunities are a primary driver of worker mobility rather than reshuffling across stable jobs. Cross-sectional analysis reveals that job reallocation rates decline sharply with plant age (from 48% at age 1 to 16% at age 15+) and size, and that virtually none of excess reallocation can be attributed to between-sector employment shifts even at the 4-digit industry level. The countercyclical pattern of job reallocation — rising in recessions, falling in booms — is driven by time variation in the magnitude of idiosyncratic plant-level shocks, primarily at older and larger establishments. The paper establishes the conceptual and measurement framework (the DH gross job flow decomposition) that has become the foundation for all subsequent empirical and theoretical work on firm dynamics, labour market flows, and macroeconomic reallocation.

| | |
|---|---|
| **Key contribution** | First comprehensive plant-level measurement of gross job flows; establishes that job reallocation is large, persistent, and drives a substantial fraction of worker mobility |
| **Key weakness** | Descriptive only; confined to manufacturing; annual frequency understates true flow magnitudes; no causal identification of countercyclical reallocation mechanism |
| **Most interesting research gap** | What happens to workers displaced by job destruction — the paper is silent on earnings losses, nonemployment duration, and occupational switching, all of which are first-order welfare questions |
| **Publishable extension** | Replicate the DH framework for Canadian data (LEAP/LEED) across the full economy, with particular attention to resource-sector dynamics and the effect of commodity price cycles on job reallocation patterns — publishable in *Canadian Journal of Economics* or *Labour Economics* |

---

<a name="paper-2"></a>
## Paper 2: Hopenhayn (1992)

**Full Citation:** Hopenhayn, Hugo A. "Entry, Exit, and Firm Dynamics in Long Run Equilibrium." *Econometrica* 60(5): 1127–1150, September 1992.

---

### 1. Research Question

What determines the rates of firm entry, exit, and the stationary distribution of firm size and profits in a competitive industry subject to idiosyncratic productivity shocks, and how do changes in industry parameters (entry costs, fixed costs, demand) affect these equilibrium outcomes?

### 2. Motivation

By the late 1980s, empirical work (Davis-Haltiwanger 1991; Dunne, Roberts, Samuelson 1989) had documented two striking facts: (i) firm-specific idiosyncratic uncertainty dominates firm-size dynamics; and (ii) industry-level entry and exit rates are highly correlated, with large, persistent cross-industry differences. Existing theoretical models — from the competitive equilibrium tradition of Lucas-Prescott (1971) to Jovanovic's (1982) passive learning model and Ericson-Pakes's (1989) active learning model — either lacked firm heterogeneity, lacked entry/exit in steady state, or were computationally intractable dynamical systems. Hopenhayn's objective is to build a tractable equilibrium model of firm dynamics that generates ongoing entry and exit in the steady state, accommodates idiosyncratic productivity shocks, admits closed-form comparative statics, and can be connected to the growing empirical literature on firm heterogeneity.

### 3. Main Contribution

The paper makes three major contributions:

1. **Stationary equilibrium concept:** Extends long-run competitive industry equilibrium to a setting with idiosyncratic shocks, firm heterogeneity, and simultaneous entry and exit in steady state. Proves existence and uniqueness of a stationary competitive equilibrium under standard conditions (Theorems 2, 3, 4).

2. **Comparative statics:** Derives clean predictions for how entry costs, fixed costs, and demand changes affect the exit threshold, firm turnover rate, and the stationary size distribution — including the counterintuitive result that higher entry costs *protect incumbents* and reduce turnover, while a mean-preserving spread of entrant productivity *increases* turnover.

3. **Lifecycle implications:** Shows that under monotone conditional dominance (mcd) ordering of the Markov transition, the distribution of firms' productivity shocks is stochastically increasing in cohort age — consistent with higher hazard rates for younger firms, higher average size for older cohorts, and regression toward the mean in growth rates. Establishes bounds on average industry profits (Proposition 7: average profit ≥ ρ·c_e where ρ is the turnover rate and c_e is the entry cost).

### 4. Relationship to the Literature

The paper explicitly extends and synthesizes three strands:
- **Jovanovic (1982):** passive learning model has no stationary equilibrium with entry/exit (the stopping time has positive probability at infinity); Hopenhayn's recurrence assumption (A.4) rules this out and enables a stationary equilibrium.
- **Lucas-Prescott (1971):** competitive equilibrium theory but with homogeneous firms and no entry/exit.
- **Ericson-Pakes (1989):** rich active-learning model but computationally intractable for analytical work.

The paper directly motivates and is used in Hopenhayn-Rogerson (1993) to study firing costs, Melitz (2003) for trade (a perfectly competitive version), Asplund-Nocke (2006) for imperfect competition, and the Acemoglu et al. (2018) model in this reading list.

### 5. Theoretical Framework / Economic Mechanism

**Industry structure:** A continuum of firms producing a homogeneous good. Output market given by inverse demand D(Q), input market by supply schedule W(N). Single input (labour), with fixed cost c_f per period and entry cost c_e (sunk).

**Firm problem:** Each period, firms observe their idiosyncratic productivity shock φ ∈ [0,1], which evolves as a Markov process F(φ'|φ) satisfying first-order stochastic dominance in φ. Firms decide to stay or exit. Exit yields zero value. The Bellman equation for an incumbent is:
```
v(φ, μ) = π(φ, μ) + max{0, β∫v(φ', μ)F(dφ'|φ)}
```
where μ is the distribution of active firms and π(φ, μ) is current-period profit (net of fixed cost).

**Exit rule:** Because v is strictly increasing in φ (higher productivity → higher value), the optimal exit rule is a *reservation rule*: exit if and only if φ < x*, where x* is endogenously determined by the condition that the value at the threshold equals zero:
```
∫v(φ', μ*)F(dφ'|x*) = 0
```

**Entry condition:** Potential entrants draw φ from initial distribution ν and pay c_e. Free entry implies:
```
∫v(φ, μ*)ν(dφ) = c_e
```

**Stationary equilibrium:** A pair (x*, M*, μ*) where x* is the optimal exit threshold, M* is the equilibrium mass of entrants, and μ* is the invariant distribution satisfying:
```
μ* = P_x·μ* + M*ν
```
where P_x is the transition operator conditional on survival (φ ≥ x*). The paper proves this fixed-point exists and is unique (under either U.1 or U.2 conditions).

**Key mechanism:** In the stationary equilibrium, there is ongoing entry and exit. Less productive firms (φ < x*) are continuously driven out by the inability to cover fixed costs, while new entrants draw from ν and may or may not survive depending on their initial draw. This selection mechanism generates a stationary distribution that is stochastically larger than the entrant distribution ν, consistent with the empirical finding that older cohorts are stochastically larger.

### 6. Data

No empirical data. The paper is purely theoretical. The empirical facts that motivate the theoretical framework — high firm and job turnover rates in U.S. manufacturing (approximately 1/3 of jobs and 40% of firms disappear over 5-year periods) — are drawn from Davis-Haltiwanger (1991) and Dunne, Roberts, Samuelson (1989). The paper provides a numerical example in Section 5 to illustrate that higher fixed costs can, counterintuitively, reduce the exit threshold under U.1.

### 7. Empirical Strategy

Not applicable. The model's cross-sectional implications (declining hazard rates with age, increasing average size with age, regression to the mean) are compared informally to empirical evidence from Dunne, Roberts, and Samuelson. No formal estimation or testing is performed.

### 8. Identification Strategy

Not applicable in a causal sense. The comparative statics results identify the direction of equilibrium responses to parameter changes (entry costs, fixed costs, demand, stochastic process moments). The key analytical tool is the algorithmic existence proof — showing that the equilibrium exit threshold x* and entry mass M* are solutions to a pair of curves M₁(x) and M₂(x) whose intersection is shown to be unique under conditions U.1 or U.2.

### 9. Main Results

**Existence and uniqueness (Theorems 2–4):**
- A stationary competitive equilibrium always exists.
- An equilibrium with positive entry and exit exists if and only if c_e < c* for some threshold c* (Theorem 3).
- Uniqueness holds under either U.1 (price-taking in input markets) or U.2 (separability of the profit function in φ and prices) (Theorem 4).

**Lifecycle properties (Propositions 3–5):**
- Under monotone conditional dominance of F, the stationary distribution of firm shocks μ* is stochastically larger than the entrant distribution ν, and the age-cohort distributions are increasing in age.
- Hazard rates (exit probabilities) are declining in both age and size.
- Conditional on survival, older and larger firms have higher expected productivity.

**Comparative statics (Section 5):**
- **Higher entry cost c_e:** Reduces equilibrium exit threshold x* (less selection, more incumbents protected) and reduces turnover rate. Entry cost acts as a barrier that protects less productive incumbents.
- **Higher fixed cost c_f:** Under U.2, *raises* the exit threshold x* (more selection, higher average productivity), leading to a more efficient distribution of active firms. However, a counterexample shows this need not hold under U.1.
- **Mean-preserving spread of entrant distribution ν:** Under convexity of v in φ, raises expected profits of entrants at existing prices, which induces an increase in x* and higher turnover.
- **Higher demand (with elastic input supply, U.1):** Has no effect on lifecycle properties or turnover; only affects the mass of active firms and output price.

**Profit and value bounds (Propositions 7–9):**
- Average industry profit π̄ ≥ ρ·c_e, where ρ is the turnover rate (inverse of average firm age). Turnover measures the minimum required average profit to sustain the entry incentive.
- Average firm value V̄ = π̄/(1-β) − βρc_e/(1-β), providing a formula for measuring implicit sunk entry costs from data on average value and profits.

### 10. Economic Magnitude and Interpretation

The paper is analytical, so magnitudes are derived from the model's structure rather than calibrated to data. The key economic insight about magnitudes is the profit lower bound: an industry with a 20% annual turnover rate (ρ = 0.2) and entry cost equal to one year's revenue would require average annual profits of at least 20% of entry cost to sustain equilibrium entry. This provides a simple empirical benchmark. The numerical example in Section 5 illustrates that the effect of higher fixed costs on the exit threshold can reverse sign depending on whether the technology features sufficiently high elasticity of profits with respect to productivity — a subtle but important caveat on the comparative statics.

### 11. Mechanisms

The central mechanism is **selection through exit**: the industry is in a constant process of creative destruction. Each period, the worst-performing firms (φ < x*) exit, their resources are freed, and new entrants draw from ν. The stationary distribution μ* reflects the steady-state balance between entry (mass M*) and exit (those whose shock falls below x*).

Three secondary mechanisms are worth noting:
- **Option value of staying:** An incumbent with φ slightly below x* may stay if the continuation value from potential future productivity improvement exceeds the current negative profit from fixed costs. This is why x* < φ_max and why even slightly unprofitable firms survive temporarily.
- **Selection amplification by age:** As cohorts age, selection removes the worst performers, leaving an increasingly productive and stable surviving set — consistent with the empirically documented declining hazard rates for older firms.
- **Competition via entry and prices:** Higher entry rates (from lower c_e or higher demand in the elastic supply case) drive down prices, raising the exit threshold and accelerating the exit of less productive incumbents. This general equilibrium price mechanism is absent from partial equilibrium analyses of firm dynamics.

### 12. Robustness Checks

As a theoretical paper, robustness is assessed through:
- Proof of existence under broad conditions (Assumptions A.1–A.5 only)
- Sufficient conditions for uniqueness (U.1 or U.2, both widely satisfied by standard functional forms)
- A numerical example demonstrating that the fixed-cost comparative static can reverse under U.1, providing an important caveat to the general result
- Extension to multidimensional state spaces (CES production function with multiple productivity parameters) shown to satisfy U.2

### 13. Limitations

1. **No dynamics:** The paper focuses entirely on stationary equilibria. Transitional dynamics — how the industry responds to a change in parameters before reaching the new stationary state — are not analyzed. This gap is addressed by Ericson-Pakes (1995) but that model loses analytical tractability.
2. **Competitive markets only:** Extension to imperfect competition requires Asplund-Nocke (2006); the price-competition effect is absent.
3. **No aggregate shocks:** The model has only idiosyncratic shocks. There are no business cycles, no aggregate uncertainty. All aggregate variables (price, total output, employment) are deterministic.
4. **Passive productivity process:** φ evolves exogenously as a Markov process. Firms cannot invest to change their position in the productivity distribution; active investment in R&D or quality is absent (handled by Ericson-Pakes, Acemoglu et al.).
5. **No worker side:** Labour is supplied elastically at price W(N). There are no labour market frictions, search, or matching. Worker welfare and earnings dynamics are outside the model.

### 14. Policy Implications

- **Entry barriers reduce turnover and protect incumbents:** Higher entry costs reduce the exit threshold, enabling less productive firms to survive. This implies that policies raising entry costs (red tape, licensing, capital requirements) not only reduce the number of new entrants but also preserve a more inefficient stock of incumbents — a double welfare cost.
- **Fixed costs and selection:** Higher fixed production costs (from regulations, compliance burdens) raise the exit threshold, *increasing* average productivity by forcing the exit of less productive firms. This provides a theoretical basis for why fixed-cost regulation, unlike entry-cost regulation, can have ambiguous welfare effects — it forces more selection but also reduces the number of active firms.
- **Firing cost policies:** The paper explicitly notes (final remarks) that a version of the model is used in Hopenhayn-Rogerson (1993) to study the effect of firing costs on job turnover and welfare. By raising effective fixed costs and reducing the pace of selection, firing costs reduce long-run productivity growth.

### 15. Overall Assessment

Hopenhayn (1992) is one of the most important theory papers in industrial organization and macroeconomics of the last 40 years. Its significance lies not in the complexity of the model — which is deliberately parsimonious — but in the analytical tractability it achieves while incorporating heterogeneity, entry, and exit simultaneously. The existence-uniqueness results, the comparative statics, and the lifecycle propositions have all become standard ingredients in quantitative macro models. The direct descendants include Melitz (2003) (international trade with heterogeneous firms, arguably the most cited trade theory paper of the 2000s), Hopenhayn-Rogerson (1993) (employment, firing costs, and welfare), and Acemoglu et al. (2018) (growth, innovation, and industrial policy — also in this reading list). The paper's limitations are largely features: by keeping the model simple, Hopenhayn made it usable. Extensions by others address the missing dynamics, imperfect competition, and aggregate shocks.

**Quality: Essential. A must-read for anyone working on firm dynamics, industrial policy, or models with heterogeneous agents.**

### 16. Relevance to My Research

Directly relevant as the theoretical foundation for any RDC project on firm entry, exit, and dynamics. The comparative statics on entry costs and fixed costs provide testable predictions for Canadian data: industries with lower entry barriers (e.g., measured by administrative costs) should show higher turnover rates and higher productivity distributions. The profit bound (average profit ≥ turnover rate × entry cost) provides a formula that could be evaluated with firm-level Canadian data (Survey of Financial Security, T2 corporate tax records). For research on labour market dynamics in Canada, Hopenhayn provides the supply-side counterpart: firms that exit destroy jobs, while entrants create jobs.

### 17. Potential Research Extensions

- Estimate the model structurally using Canadian firm-level data to recover the key parameters: entry cost c_e, fixed cost c_f, and the Markov process F(φ'|φ)
- Exploit provincial variation in entry costs and fixed regulatory costs (business environment indices) to test the comparative statics predictions across Canadian provinces
- Embed in a GE model with labour market search to study the interaction between firm exit rates and unemployment duration

### 18. Research Gaps

- **Transitional dynamics:** What is the path from one stationary equilibrium to another after a parameter change? Policy reform evaluations require knowing these dynamics, but the paper is silent on them.
- **Worker heterogeneity:** The model treats all labour as homogeneous. A natural extension would allow workers to match differentially with firm types, generating wage variation driven by firm productivity heterogeneity.
- **The role of financial constraints:** Firms below the exit threshold might remain if they can access external finance. The model assumes perfect capital markets; introducing credit constraints could generate amplification and richer dynamics.

### 19. Methodological Lessons

1. The stationarity equilibrium concept — requiring that the invariant measure of the firm distribution equals the measure generated by the entry/exit rules and entry distribution — is the right way to think about long-run industry equilibria with heterogeneous firms.
2. The algorithmic existence proof (constructing M₁(x) and M₂(x) curves) provides a computational roadmap for numerical implementation — a rare feature of analytical theory papers.
3. The mcd (monotone conditional dominance) ordering is a stronger-than-FOSD but weaker-than-likelihood-ratio condition that survives the truncation from the exit threshold — a useful technical tool for dynamic selection models.

---

### Five-Sentence Summary

Hopenhayn (1992) develops a tractable dynamic stochastic model of a competitive industry in which firms face idiosyncratic productivity shocks and choose optimally when to exit, with free entry driving expected profits to the entry cost. The concept of stationary competitive equilibrium — a steady-state where entry and exit rates are equal and the distribution of active firms is time-invariant — is introduced and shown to exist and be unique under broad conditions. Comparative statics demonstrate that higher entry costs reduce turnover by protecting less productive incumbents, while higher fixed costs (under separability) raise the exit threshold and improve average firm productivity through selection. Under monotone conditional dominance of the productivity process, the model implies that older cohorts of firms are stochastically larger, have lower hazard rates, and earn higher average profits — all consistent with the empirical evidence from Dunne, Roberts, and Samuelson. The paper provides the canonical theoretical framework for all subsequent quantitative work on firm dynamics, entry, exit, and the long-run effects of industrial policy on productivity and resource allocation.

| | |
|---|---|
| **Key contribution** | Tractable, analytically characterized stationary equilibrium with simultaneous entry and exit driven by idiosyncratic productivity; clean comparative statics on entry/fixed costs and demand |
| **Key weakness** | No aggregate shocks (no business cycle); no transitional dynamics; perfectly competitive markets only; no investment in productivity |
| **Most interesting research gap** | Transitional dynamics after policy changes — a reform that reduces entry costs, for instance, generates an extended transition with new cohort dynamics that the stationary analysis cannot characterize |
| **Publishable extension** | Structural estimation of the Hopenhayn model using Canadian T2 tax data, exploiting variation in effective provincial entry costs (regulatory burden indices) to identify the entry cost parameter and test comparative statics predictions on firm turnover and productivity distributions — publishable in *Journal of Political Economy* or *Review of Economic Dynamics* |

---

<a name="paper-3"></a>
## Paper 3: Campbell & Fisher (2000)

**Full Citation:** Campbell, Jeffrey R. and Jonas D.M. Fisher. "Aggregate Employment Fluctuations with Microeconomic Asymmetries." *American Economic Review* 90(5): 1323–1345, December 2000.

---

### 1. Research Question

Can proportional plant-level costs of creating and destroying jobs — net adjustment costs — explain the empirically documented fact that the job destruction rate fluctuates more than the job creation rate in U.S. manufacturing?

### 2. Motivation

Davis et al. (1996) and the preceding DH1992 paper document that job destruction is substantially more volatile over the business cycle than job creation in U.S. manufacturing. This asymmetry is challenging for standard macroeconomic theory: the one-sector stochastic growth model with homogeneous plants predicts that job creation and destruction respond equally and symmetrically to aggregate shocks. Existing explanations for the asymmetry — Caballero's (1992) model requiring asymmetrically distributed aggregate shocks, Foote's (1998) model requiring downward employment trends — either introduce arbitrary features of the driving process or are quantitatively insufficient. Campbell and Fisher ask whether a minimal, internally motivated modification of the standard model — proportional *net* adjustment costs — can generate the observed asymmetry using a symmetrically distributed aggregate shock.

### 3. Main Contribution

The paper establishes that proportional net adjustment costs create an endogenous *policy asymmetry*: the employment decisions of job-destroying (shrinking) plants are more sensitive to wage changes than those of job-creating (expanding) plants. In a calibrated model with continuous idiosyncratic productivity shocks and ongoing aggregate wage fluctuations, this microeconomic asymmetry is preserved in the aggregate under plausible parameter values, generating job destruction volatility that exceeds job creation volatility — consistent with U.S. manufacturing data for the transportation equipment industry. The contribution is both analytical (establishing the policy asymmetry mechanism) and quantitative (showing the aggregation condition under which it is preserved).

### 4. Relationship to the Literature

The paper is positioned at the intersection of the gross job flows literature (Davis-Haltiwanger 1990, 1992; Mortensen-Pissarides 1994; Caballero-Hammour 1994, 1996) and the employment adjustment cost literature (Sargent 1978; Hamermesh 1989; Bentolila-Bertola 1990; Hopenhayn-Rogerson 1993). Its distinctive feature is the emphasis on *net* adjustment costs — costs that depend on the *number* of jobs created or destroyed, not on the *identity* of the workers involved. This distinguishes the paper from the search-matching literature (Mortensen-Pissarides 1994), which features matching frictions, and from the firing-cost literature (Bentolila-Bertola 1990; Hopenhayn-Rogerson 1993), where costs are interpreted as firing payments to specific workers. The paper's identification of the policy asymmetry mechanism is novel; Caballero (1992) had shown that a similar model generates symmetric gross flows unless the driving process is asymmetrically distributed, but Campbell-Fisher show that proportional (rather than kinked or quadratic) adjustment costs generate an asymmetry even with a symmetric driving process.

### 5. Theoretical Framework / Economic Mechanism

**Plant problem:** Each plant `i` produces output `z_t · n_t^α` where `z_t` is idiosyncratic productivity (Markov; log-random-walk with i.i.d. innovation ε_t ~ N(μ, σ_z)) and `n_t` is employment. The plant pays net adjustment costs: `t_c` units of lost output per job added (creation cost) and `t_d` units per job subtracted (destruction cost). The Bellman equation becomes:
```
g(z, x, W) = max_y { z^{1/(1-α)} [y^α - Wy - τ(y,x)(y-x)] + βE[g(z', y/u', W')|z, W] }
```
where `x = n_{t-1}/z^{1/(1-α)}` is scaled lagged employment and `y` is scaled current employment.

**Policy asymmetry:** Because `g` is homogeneous of degree `1/(1-α)` in `z`, the optimal policy can be expressed in terms of scaled variables alone: the plant creates jobs (y > x) if `x < y(W)`, destroys jobs (y < x) if `x > y#(W)`, and leaves employment unchanged if `y(W) ≤ x ≤ y#(W)`. The key result is:

```
∂ ln n#/∂ ln W = -1/(1-α) · W/[W - (1-β(1-p))t_d - βp·t_c]
```
has larger absolute value than:
```
∂ ln nI/∂ ln W = -1/(1-α) · W/[W + (1-β(1-p))t_c + βp·t_d]
```

Since the denominator of the destruction elasticity subtracts adjustment cost terms while the creation elasticity's denominator adds them, |∂ ln n#/∂ ln W| > |∂ ln nI/∂ ln W| for any positive adjustment costs. This is the policy asymmetry: a wage increase causes shrinking plants to reduce employment by more than expanding plants increase it.

**Growth-rate asymmetry countervailing force:** The actual growth rate `g_t(i) = n_t(i)/n_{t-1}(i) - 1` is a convex function of the log-growth rate. For plants near the destruction margin (large contraction), the actual growth rate is less responsive than the logarithmic approximation would suggest, while for plants near the creation margin (small expansion), the reverse holds. This growth-rate asymmetry partially offsets the policy asymmetry when computing aggregate gross job flows via the DH formulas (equations 13 and 14).

**Net effect:** Whether the policy asymmetry dominates the growth-rate asymmetry depends on the persistence of idiosyncratic shocks. With less persistent shocks (lower first-order autocorrelation ρ), the policy asymmetry is stronger — because both the creation cost saved and the destruction cost incurred in the future are discounted more — and can dominate the growth-rate asymmetry, generating aggregate NEG > POS volatility.

### 6. Data

- **Calibration target:** Quarterly gross job creation and destruction data for the Transportation Equipment industry (SIC 37) — manufacturing's largest 2-digit industry — from the LRD/BED data
- **Key moments used:** Average net employment growth (−0.11%/quarter), average job reallocation rate (11.3%), standard deviation of employment growth (3.55%), first-order autocorrelation of employment growth (0.08)
- **Calibrated parameters:** α = 0.66 (labour share), β = 1.052^{1/4} (5% annual discount), σ_z calibrated to match job reallocation rate; aggregate shock parameters (ρ, σ_w) calibrated to match employment growth moments

### 7. Empirical Strategy

Calibration and model simulation, not estimation. The strategy is:
1. Parameterize the model using standard values and calibrated moments from SIC 37 data
2. Simulate the model to compute time series of aggregate POS and NEG
3. Compare simulated moments (means, standard deviations, covariances of POS, NEG, NET) to their empirical counterparts
4. Vary adjustment cost parameters (t_c, t_d) within plausible empirical bounds to assess sensitivity

### 8. Identification Strategy

No formal identification in the econometric sense. The paper makes predictions that it compares to data descriptively. The comparison is qualitative ("can the model generate the observed asymmetry?") and quantitative ("how much of the observed excess volatility of NEG can be explained?"). The identifying variation is the parameterization of adjustment costs — taken from external evidence (Los Angeles employer surveys, Dutch firm studies, Spanish structural estimates, and anecdotal evidence from aerospace production). The paper explicitly acknowledges that net adjustment costs are intrinsically difficult to measure.

### 9. Main Results

**Analytical (Section I):**
- Policy asymmetry holds for any strictly positive adjustment costs, regardless of the relative magnitudes of t_c and t_d
- The asymmetry is stronger when idiosyncratic shocks are less persistent (smaller ρ_idio)
- The growth-rate asymmetry always works against the policy asymmetry in computing aggregate flows

**Quantitative (Section III):**
- **Baseline calibration** (ρ = 0.08, matching employment growth autocorrelation): model generates a ratio of std(NEG)/std(POS) ≈ 1.8–2.0, comparable to the empirical ratio for SIC 37 (approximately 1.5–2.0 depending on sample period). Without adjustment costs (t_c = t_d = 0), the ratio is ≈ 1.0 — the standard model prediction.
- **Higher autocorrelation:** With ρ = 0.5 (more persistent aggregate shocks), the policy asymmetry weakens and the growth-rate asymmetry can dominate, actually generating std(POS) > std(NEG) in some calibrations — the opposite of the data.
- **Sensitivity to t_c vs. t_d:** Both creation and destruction costs contribute to the asymmetry; neither is redundant.
- **Without aggregate uncertainty:** The model still generates ongoing job creation and destruction from idiosyncratic shocks, but the ratio std(NEG)/std(POS) = 1.0 exactly (by symmetry of the random walk innovation).

The paper also shows that the model's implications for the cross-correlation between gross flows (negative ρ(POS, NEG), close to zero or negative ρ(NET, SUM)) are broadly consistent with the data, although the model cannot match all moments simultaneously.

### 10. Economic Magnitude and Interpretation

The transportation equipment industry (SIC 37) exhibits in the data: std(NEG) ≈ 2.0–2.5%, std(POS) ≈ 1.0–1.5%, for a ratio of approximately 1.5–2.0. The model with baseline calibration generates a ratio in the same range. The finding is thus that proportional net adjustment costs of plausible magnitude (roughly 0.5–1.5 quarterly wages) can account for the bulk of the observed asymmetry. The mechanism works through aggregate wage fluctuations — not through the idiosyncratic shocks, which by themselves generate symmetric flows. This is an important distinction: the paper identifies the aggregate component of gross job flow asymmetries, not the idiosyncratic component.

### 11. Mechanisms

Three forces interact:
1. **Policy asymmetry (main driver):** Adjustment costs make the destruction threshold more elastic to wage changes than the creation threshold. Each 1% increase in the wage causes shrinking plants to shrink by more than expanding plants expand.
2. **Growth-rate asymmetry (countervailing):** The convexity of actual vs. logarithmic growth rates makes job creators at the margin more responsive in actual terms even when policy is symmetric in log terms. This works against the policy asymmetry.
3. **Plant distribution dynamics:** Aggregation over the cross-section of plants reflects the endogenous evolution of the distribution of scaled employment `x` across plants. In Caballero's (1992) (S,s) model, this endogenous evolution exactly offsets the microeconomic asymmetry. Campbell-Fisher show that with random-walk idiosyncratic shocks and proportional (not (S,s)) adjustment costs, the evolution of the distribution preserves rather than offsets the policy asymmetry.

### 12. Robustness Checks

- Results reported for six different combinations of adjustment cost parameters and aggregate shock persistence parameters
- Model compared to the economy-wide gross job flow data (not just SIC 37) with qualitatively similar results
- General equilibrium version of the model developed to show that the industry-equilibrium results have a valid GE interpretation
- The paper explicitly notes that gross adjustment costs (costs that depend on worker identity, not net employment changes) would *not* generate the asymmetry, providing a test of the net vs. gross adjustment cost distinction

### 13. Limitations

1. **No matching frictions:** The model abstracts entirely from search and matching. In reality, it is harder for a firm to fill a vacancy than to fire a worker, which adds additional asymmetry. The paper's mechanism works independently of matching frictions, but the quantitative assessment does not account for their potentially reinforcing effects.
2. **Symmetric aggregate shocks:** The model assumes symmetrically distributed aggregate uncertainty. In reality, recessions may be more severe than expansions, which could compound the effect (Caballero's mechanism) or partially mask it.
3. **Calibration, not estimation:** The adjustment costs (t_c, t_d) are selected from a range of plausible values, not formally estimated. The model cannot be rejected on these dimensions.
4. **Manufacturing only:** The calibration uses manufacturing data. Service sectors, where labour market dynamics may differ substantially, are excluded.
5. **No entry/exit:** The population of plants is fixed. Entry and exit are excluded by assumption, which is a significant abstraction given that DH1992 shows births and deaths account for 20–25% of gross job flows.

### 14. Policy Implications

- The model implies that firing costs (which increase t_d) *reduce* employment volatility by dampening the destruction response to adverse shocks — consistent with the Bentolila-Bertola (1990) motivation for firing-cost policies in Europe. However, this dampening comes at a cost: the creation response is also reduced (though by less), lowering overall flexibility.
- The mechanism suggests that policies reducing hiring costs (subsidies, reduced administrative burden) specifically for expanding plants would reduce the volatility asymmetry by raising the creation elasticity. This is the symmetry-restoring policy implication.
- The paper provides a new rationale for the observed excess volatility of unemployment in recessions: it partly reflects the greater sensitivity of plant-level employment cuts to aggregate shocks, not just the "cleansing" of less productive matches.

### 15. Overall Assessment

Campbell and Fisher (2000) is a rigorous and well-motivated paper that makes a genuinely original theoretical point — the policy asymmetry mechanism — and shows it has quantitative bite. The general equilibrium embedding is careful. The main weakness is the calibration approach, which limits the paper's ability to formally assess how much of the observed asymmetry is explained by the mechanism (vs. other factors). The paper is less influential than DH1992 or Hopenhayn (1992), partly because the Mortensen-Pissarides search-and-matching framework (which can also generate asymmetric responses through threshold effects) became dominant in the subsequent decade, and partly because the mechanism requires that aggregate shocks operate primarily through wages — a maintained assumption that is contestable. Nevertheless, the paper remains a clean and insightful contribution to understanding gross job flow dynamics.

**Quality: Good. A solid theoretical contribution with careful quantitative assessment.**

### 16. Relevance to My Research

The policy asymmetry mechanism has direct relevance for understanding how Canadian firms respond to aggregate shocks (commodity price cycles, exchange rate changes) in different ways depending on whether they are expanding or contracting. For an RDC project examining establishment-level employment changes in Canada, the key testable prediction is: the elasticity of employment cuts to adverse shocks should exceed the elasticity of employment additions to favorable shocks of the same magnitude, and this asymmetry should be larger for less persistent aggregate shocks. Canadian data would allow testing whether this holds in resource-heavy provinces versus manufacturing centres.

### 17. Potential Research Extensions

- Estimate t_c and t_d structurally from Canadian establishment-level data by matching moments of the job creation/destruction distribution, allowing estimation of the model's degree of asymmetry
- Test the model's prediction that industries with more transient aggregate shocks (e.g., commodity sectors) show larger std(NEG)/std(POS) ratios than industries with persistent shocks

### 18. Research Gaps

- The paper does not model worker heterogeneity or worker-level welfare consequences of the asymmetric adjustment process
- There is no explanation for why t_c and t_d should differ, or how they vary across industries, countries, or regulatory regimes

### 19. Methodological Lessons

1. The DH growth rate metric (g = ΔN/average(N)) versus the log-difference matters for quantitative model evaluation: the growth-rate asymmetry is a real force that works against the policy asymmetry and would be missed if one computed flows using log-approximations.
2. The policy asymmetry result holds analytically for any positive adjustment costs — showing a qualitative result before turning to quantitative assessment is methodologically important.
3. Comparing model-generated statistics to industry-level data (SIC 37) rather than economy-wide data is the right level of aggregation when the model is an industry-equilibrium model — an important methodological discipline.

---

### Five-Sentence Summary

Campbell and Fisher (2000) show that proportional net adjustment costs — costs that depend on the number of jobs created or destroyed, not the identity of workers — create a policy asymmetry at the plant level: shrinking plants are more sensitive to wage changes than expanding plants, because adjustment costs add to the total cost of job creation but reduce the total cost of job destruction. This microeconomic asymmetry, when preserved through aggregation, generates a model in which the rate of job destruction fluctuates more than the rate of job creation in response to aggregate shocks — a key stylized fact from U.S. manufacturing that standard representative-agent models fail to reproduce. A growth-rate asymmetry (convexity of actual vs. log growth rates) works in the opposite direction and can dominate when idiosyncratic shocks are highly persistent, so the mechanism is strongest for relatively transient aggregate fluctuations. A calibrated version of the model for the U.S. transportation equipment industry generates a std(NEG)/std(POS) ratio comparable to the data, explaining most of the observed excess volatility of job destruction without requiring an asymmetrically distributed driving process. The paper provides a clean, internally motivated explanation for job flow asymmetries based on the loss of production incurred when reorganizing a plant to operate at a larger or smaller scale.

| | |
|---|---|
| **Key contribution** | Analytical policy asymmetry mechanism: net adjustment costs make job destruction more elastic to aggregate shocks than job creation, even with symmetric driving process |
| **Key weakness** | Calibration (not estimation) of adjustment costs; no entry/exit; model cannot be formally tested against alternative explanations |
| **Most interesting research gap** | Does the policy asymmetry vary systematically across industries with different regulatory environments (e.g., high vs. low firing costs)? A cross-country test of the mechanism would be revealing |
| **Publishable extension** | Test the Campbell-Fisher mechanism using matched employer-employee data from Canada, comparing the employment creation and destruction elasticities to province-level commodity price cycles across industries with high and low regulatory adjustment cost environments |

---

<a name="paper-4"></a>
## Paper 4: Davis & Haltiwanger (1999)

**Full Citation:** Davis, Steven J. and John Haltiwanger. "On the Driving Forces Behind Cyclical Movements in Employment and Job Reallocation." *American Economic Review* 89(5): 1234–1258, December 1999.

---

### 1. Research Question

What types of structural disturbances — allocative shocks (which shift the distribution of employment opportunities across locations) versus aggregate shocks (which move all plants in the same direction) — are the primary drivers of cyclical movements in aggregate employment and job reallocation in U.S. manufacturing?

### 2. Motivation

The DH1992 paper documented that (i) job reallocation is countercyclical and (ii) job destruction is substantially more volatile than job creation. A key question left open is whether these patterns reflect mainly allocative disturbances (shifts in the desired allocation of labor across job sites, perhaps driven by sector-specific technology, oil price, or structural change shocks) or aggregate disturbances (shocks that move the economy as a whole, such as monetary policy, aggregate demand, or aggregate productivity). This distinction matters enormously for policy: if reallocation is primarily driven by allocative shocks, standard aggregate demand stabilization policy cannot reduce it and might not even be desirable; if aggregate shocks drive most employment fluctuations, they are more amenable to conventional macroeconomic interventions. Previous VAR identification strategies (Blanchard-Quah, Bernanke) could not exploit the information in gross job flows. DH1999 develops a novel identification strategy using the creation-destruction decomposition that allows both qualitative and quantitative restrictions motivated by economic theory.

### 3. Main Contribution

The paper makes three contributions:

1. **Identification strategy:** Develops a structural VAR framework where the decomposition of employment changes into creation and destruction rates provides novel identifying information. Aggregate and allocative disturbances have *qualitatively different* implications for creation and destruction: aggregate shocks move them in opposite directions (creation down, destruction up), while allocative shocks move them in the same direction. This qualitative difference constrains the admissible structural parameter space.

2. **Tighter inequality restrictions:** Theory implies additional restrictions on the magnitude of contemporaneous responses — that job destruction responds at least as much as job creation to aggregate shocks (bna ≤ −1), and that the contemporaneous impact of allocative shocks on job creation does not exceed that on job destruction (|bps| ≤ 1). These tighter restrictions, drawn from search-theoretic models and option-value arguments, substantially narrow the range of permissible inferences.

3. **Empirical results with long data:** Estimates the system over 1947:Q1–1993:Q4, exploiting a long quarterly series constructed by splicing LRD data (1972–1993) with BLS turnover data (1947–1981) using a cyclically varying quit replacement rate.

### 4. Relationship to the Literature

The paper is a direct successor to DH1992 and DH1990. It is methodologically related to the structural VAR literature (Blanchard-Quah 1989; King-Watson 1992; Shapiro-Watson 1988) but extends it by using the creation-destruction decomposition to generate additional identifying restrictions not available in aggregate time series. It contributes to the debate between "cleansing recession" theories (Caballero-Hammour 1994; Lilien 1982) — where recessions reallocate efficiently — and "sullying" theories — where aggregate shocks are the primary drivers and reallocation is a byproduct. The paper shows that the identification of which shock dominates depends critically on which restrictions one is willing to impose, and it maps out the trade-offs explicitly.

### 5. Theoretical Framework / Economic Mechanism

**Structural MA representation:**
```
Y_t = B(L)ε_t,    B(0) = B_0
```
where `Y_t = [POS_t, NEG_t]'`, `ε_t = [ε^a_t, ε^s_t]'` are aggregate (a) and allocative (s) structural innovations, and `B_0` is the contemporaneous response matrix.

**Reduced-form VAR:**
```
Y_t = D(L)η_t,    D(0) = I
```
with reduced-form innovations `η_t = B_0 ε_t`.

**Identification problem:** With 4 elements of B_0 normalized (diagonal elements = 1), there are 2 free parameters: `b_{na}` (how much an aggregate shock contemporaneously affects job creation relative to destruction) and `b_{ps}` (how much an allocative shock contemporaneously affects job destruction relative to creation). The zero covariance restriction `Cov(ε^a, ε^s) = 0` provides 1 restriction, leaving the system one-dimensionally underidentified.

**Weak inequality restrictions:**
- (i) `b_{na} < 0`: aggregate shocks move creation and destruction in opposite directions
- (ii) `b_{ps} > 0`: allocative shocks move both in the same direction

**Tighter inequality restrictions (theory-motivated):**
- (i)' `b_{na} ≤ −1`: job destruction responds at least as much as job creation to aggregate shocks (from Mortensen-Pissarides model: separations occur instantly while new matches require search time)
- (ii.a)' `|b_{ps}| ≤ 1`: allocative shocks impact creation no more than destruction in absolute terms (from option-value argument: sunk costs of investment make it optimal to delay creation in the face of uncertain future conditions, while destruction can occur immediately)
- (ii.b)' allocative shocks have a positive *cumulative* effect on job creation over 16 quarters

**Long-run neutrality restrictions (alternative identification):**
- (iv) Aggregate shocks have no cumulative effect on total job reallocation
- (iv)' Aggregate shocks have no cumulative effect on excess job reallocation
- (v) Allocative shocks have no permanent effect on employment level

### 6. Data

- **Primary source (1972–1993):** LRD quarterly job creation and destruction data, updated through 1993
- **Secondary source (1947–1981):** BLS monthly turnover data (accessions, layoffs, quits), converted to job creation and destruction rates using the Blanchard-Diamond (1990) method with a *cyclically varying* quit replacement rate
- **Splicing:** Join the two series over the 1972–1981 overlap period; simple correlation between implied net employment growth and BLS 790 data is 0.91
- **Sample period:** 1947:Q1–1993:Q4; 187 quarterly observations
- **Key statistics (Table 1):** POS mean 5.8%, NEG mean 6.0%, NET mean −0.1%, SUM mean 11.8% (all quarterly, as % of employment); std(NEG) = 1.5% > std(POS) = 1.2%; ρ(POS, NEG) = −0.17 (full sample), −0.56 (linearly detrended)

### 7. Empirical Strategy

Structural VAR estimation with multiple identification schemes:
1. Estimate a 2-variable VAR in POS and NEG with 4 lags (Dickey-Fuller tests reject unit roots in both series)
2. Derive the reduced-form covariance matrix
3. Apply each set of identifying restrictions (weak inequalities, tighter inequalities, neutrality restrictions) to recover admissible ranges for (b_na, b_ps) and corresponding variance decompositions
4. Bootstrap standard errors using 1,000 Monte Carlo draws
5. Construct historical decompositions at boundary values of the admissible parameter space

### 8. Identification Strategy

**This is the paper's central methodological innovation.** Rather than point-identifying the system, the paper derives ranges of parameter values consistent with a set of qualitative restrictions, then reports the implied range of variance decompositions.

Key identification elements:
- **Sign restrictions on contemporaneous responses** (bna < 0, bps > 0): definitional and accepted by nearly all theories
- **Magnitude restrictions on contemporaneous responses** (bna ≤ −1, |bps| ≤ 1): theory-motivated from search models and option value arguments; these are the *binding* restrictions that narrow the admissible range
- **Zero covariance** between structural innovations: standard in the VAR literature; the paper explores sensitivity to relaxing this

**Identification challenge:** Because the system remains one-dimensionally underidentified even after the zero covariance restriction, the paper must either (a) impose inequality restrictions that define a range rather than a point, or (b) impose additional equality restrictions (long-run neutrality) that achieve point identification.

**Critical limitation of identification:** The mapping from (b_na, b_ps) to variance decompositions is highly nonlinear (Figure 3). The allocation of variance between aggregate and allocative shocks is extremely sensitive to where in the admissible range one sits. This is not a weakness of the paper's approach — it is an honest disclosure of the limits of what the data can tell us — but it means the "result" is largely a characterization of the uncertainty, not a point estimate.

### 9. Main Results

**Under weak restrictions (Figure 3):**
- Admissible range: b_na ∈ (−2.5, −0.87)
- Allocative shocks account for 5–20% of variance in employment growth at 4-step horizon
- Aggregate shocks: major driver of employment fluctuations across all admissible parameters
- Allocative shocks account for 20–90% of job reallocation variance — huge range

**Under tighter restrictions (Table 3, columns 1–2):**
- Admissible range narrows to b_na ∈ (−1.63, −1.0), b_ps ∈ (0.1, 1.0)
- Allocative shocks: 3–17% of employment growth variance (4–16 step horizon) → low share
- Allocative shocks: 44–80% of job reallocation variance → dominant share
- **Key inference:** Allocative shocks are a minor driver of employment fluctuations but the dominant driver of job reallocation intensity

**Under neutrality restrictions (Table 3, columns 3–5):**
- Restricting allocative shocks to have no long-run effect on employment (v) yields b_na = 0.03, b_ps = −0.41 — *violates* the weak qualitative restrictions (i) and (ii)
- Restricting aggregate shocks to have no long-run effect on job reallocation (iv) yields b_na = −0.68, b_ps = −0.12 — also violates (i)' and (i)
- Under these neutrality restrictions, allocative shocks account for 34–80% of employment growth variance and 82–94% of reallocation variance

**Historical decompositions (Figures 4–5):**
- With b_na = −1 (symmetric contemporaneous response): allocative shocks contribute most to reallocation fluctuations and make a non-trivial contribution to employment fluctuations, especially in the late 1950s and early 1980s downturns
- With b_ps = 1 (symmetric allocative response): allocative shocks dominate reallocation but have negligible effect on employment growth

**Sensitivity to zero covariance (Figures 7–8):**
- For r(ε^a, ε^s) = −0.3, the admissible parameter space shrinks; for r = −0.45, it collapses to a single point
- For r = +0.3, the space expands but a large share of variance is attributed to the covariance term and cannot be unambiguously allocated

### 10. Economic Magnitude and Interpretation

The paper's core quantitative finding under the tighter qualitative restrictions (the identification scheme most grounded in theory) is that:
- **Aggregate shocks account for 83–97% of cyclical variation in employment growth** (4-step forecast errors)
- **Allocative shocks account for 44–80% of cyclical variation in job reallocation intensity**

This means that while the economy's cycles (employment booms and recessions) are primarily driven by aggregate disturbances, the countercyclical movements in job reallocation (the simultaneous rise in creation and destruction during downturns) are primarily driven by allocative disturbances — sector-specific or locational shocks that force reshuffling of the workforce. The two findings are not in tension: aggregate shocks cause recessions; allocative shocks cause the gross flows that accompany them independently.

### 11. Mechanisms

Two mechanisms determine the relative importance of aggregate vs. allocative shocks:

1. **Opportunity cost mechanism (Davis-Haltiwanger 1990):** During recessions, the opportunity cost of relocating workers falls (unemployed workers have low foregone output from searching), so the pace of allocative reallocation endogenously increases. This predicts that even a constant stream of allocative disturbances will generate countercyclical reallocation intensity.

2. **Option value / sunk cost mechanism:** The sunk nature of investments required to create new vacancies and form matches generates an option value for waiting in the face of an allocative innovation. When allocative shocks are serially correlated (Table 2 shows significant autocorrelation in cross-industry return dispersion), this option value effect simultaneously depresses job creation and boosts job destruction in response to an allocative shock, which can cause the short-run employment effect of an allocative disturbance to be negative (b_ps < 0).

### 12. Robustness Checks

- Results reported for 5 different identification schemes (qualitative and neutrality restrictions)
- Sensitivity analysis for r(ε^a, ε^s) ∈ {−0.3, 0, +0.3}
- BLS 790 data cross-validation (ρ = 0.91 between implied net employment growth and BLS series)
- Dickey-Fuller tests confirm stationarity of POS and NEG series (unit root rejected)
- The paper also runs VARs with deterministic trends as sensitivity checks (results similar)

### 13. Limitations

1. **One-dimensional underidentification:** No single identifying restriction produces a unique parameter point; the paper honestly reports ranges rather than point estimates, but this prevents sharp conclusions.
2. **Two-variable system:** The VAR in (POS, NEG) cannot distinguish among multiple types of allocative or aggregate shocks (technology, monetary, fiscal, oil). Disaggregated shock identification is not possible within this framework.
3. **Manufacturing only:** The long historical series is available only for manufacturing, which may be unrepresentative of the aggregate economy and exhibits secular decline over the sample.
4. **BLS splicing:** The 1947–1971 portion of the data is constructed from aggregate BLS turnover data using a maintained assumption about quit replacement rates. This introduces measurement error, though the high correlation with BLS 790 data provides some assurance.
5. **Linearity:** The VAR is linear. Nonlinear interactions between aggregate and allocative shocks — which the theories described in Section I all suggest — are not accommodated.
6. **Symmetric disturbances assumed:** The paper explores sensitivity to correlated shocks but maintains the assumption that the structural innovations are contemporaneously uncorrelated in the baseline. Theories of "cleansing recessions" where aggregate downturns trigger allocative shocks (Schivardi 1997) are not fully accommodated.

### 14. Policy Implications

- Because aggregate shocks drive most cyclical employment fluctuations under the preferred (tighter) identifying assumptions, standard aggregate demand policies can influence employment — but they do not address the underlying allocative process that determines job reallocation intensity.
- The finding that allocative shocks are a minor driver of employment cycles but a dominant driver of reallocation suggests that policies targeting "structural unemployment" (skills mismatches, geographic immobility) are addressing a separate phenomenon from cyclical unemployment.
- The long-run neutrality restriction results (where allocative shocks account for 34–80% of employment variance) would, if taken seriously, suggest a much larger role for structural policies — but these restrictions are theoretically inconsistent with other identifying assumptions, reducing their credibility.

### 15. Overall Assessment

DH1999 is a methodologically important paper that introduces a genuinely novel approach to structural VAR identification using the creation-destruction decomposition. It is honest about the limits of what the data can identify and clearly maps the trade-offs between different sets of assumptions. The main empirical finding — under theory-motivated tighter restrictions, aggregate shocks drive most employment cyclicality while allocative shocks drive most reallocation cyclicality — is sensible and has influenced the subsequent literature. The paper's weakness is that its conclusions are range-valued rather than point estimates, and the ranges are wide enough to be somewhat uninformative on policy-relevant questions. The paper would benefit from a richer VAR system (including additional variables like oil prices, monetary aggregates, or industry return dispersion) to shrink the admissible parameter space further.

**Quality: Very good. A methodologically careful paper with important empirical findings, though limited by data and identification constraints.**

### 16. Relevance to My Research

The identification strategy — using the creation-destruction decomposition to distinguish allocative from aggregate shocks — is directly applicable to Canadian data. With LEAP/LEED, one could construct quarterly job creation and destruction series for the entire Canadian economy (not just manufacturing) and estimate the DH1999 structural VAR. Moreover, the Canadian context is particularly interesting because the economy is subject to both aggregate shocks (U.S. monetary policy spillovers, global demand) and strong allocative shocks (commodity price cycles, which have large sector-specific effects). Testing whether the relative importance of allocative vs. aggregate shocks differs in resource-intensive provinces versus manufacturing provinces would be a natural extension.

### 17. Potential Research Extensions

- Extend the DH1999 VAR to the service sector in Canada using the full LEAP/LEED universe, which would make the sample more representative of the aggregate economy
- Add oil price innovations and exchange rate movements as additional variables in an expanded VAR, exploiting Canadian resource-sector dynamics to better identify allocative shock contributions
- Use regional variation in commodity price exposure to construct province-specific identifying restrictions on allocative shock magnitudes

### 18. Research Gaps

- The paper uses only two variables (POS, NEG). Expanding to a four-variable system (POS, NEG, unemployment, vacancies) would permit additional restrictions from Beveridge curve theory and substantially tighten identification.
- The allocation between aggregate and allocative shocks is sensitive to the correlation between the two structural innovations (r(ε^a, ε^s)) but the paper has no empirical estimate of this parameter — a significant gap.

### 19. Methodological Lessons

1. The creation-destruction decomposition provides identifying information unavailable in aggregate net employment data: allocative and aggregate shocks have qualitatively different creation-destruction responses, and theory imposes magnitude restrictions. Both are valuable for identification.
2. When a system is underidentified, reporting the range of inferences over the admissible parameter space (rather than arbitrary point identification) is the intellectually honest approach — even if it produces wide-range results.
3. Long-run neutrality restrictions and short-run qualitative restrictions can be inconsistent with each other (as shown in Table 3), providing a diagnostic for whether theoretical identifying assumptions are internally consistent.
4. The serial correlation of cross-industry stock return dispersion (Table 2) as evidence for the option value mechanism is a simple and elegant indirect test of the theoretical underpinning of an identifying assumption.

---

### Five-Sentence Summary

Davis and Haltiwanger (1999) develop a structural VAR framework for a bivariate system of quarterly job creation and destruction rates in U.S. manufacturing (1947–1993), exploiting the qualitatively different responses of creation and destruction to aggregate versus allocative shocks to generate novel identifying restrictions that are unavailable in aggregate employment data alone. Weak inequality restrictions establish that aggregate shocks are always major driving forces behind employment fluctuations, while the contribution of allocative shocks to employment variance ranges widely (5–20%) depending on the structural parameter values. Imposing tighter theory-motivated restrictions — that job destruction responds at least as much as creation to aggregate shocks, and that allocative shocks cannot simultaneously boost employment — narrows the range to 3–17% of employment variance explained by allocative shocks but confirms that allocative shocks account for 44–80% of job reallocation intensity variance. Long-run neutrality restrictions (e.g., that allocative shocks have no permanent employment effect) imply an even larger role for allocative shocks in both employment and reallocation variance, but these restrictions are inconsistent with the sign restrictions implied by theory. The paper's core message is that aggregate shocks drive most cyclical employment fluctuations, while allocative disturbances are the dominant driver of the countercyclical movements in job reallocation that accompany those cycles.

| | |
|---|---|
| **Key contribution** | Novel structural VAR identification using job creation-destruction decomposition; maps the range of inferences over the admissible structural parameter space under qualitative restrictions from theory |
| **Key weakness** | System remains one-dimensionally underidentified; wide admissible ranges limit sharp empirical conclusions; manufacturing-only sample; long-run and short-run restrictions are internally inconsistent |
| **Most interesting research gap** | Expanding to a four-variable system (POS, NEG, unemployment rate, vacancy rate) would permit Beveridge curve restrictions to tighten identification further and address whether the allocative-aggregate decomposition is stable across business cycle phases |
| **Publishable extension** | Construct a DH1999-type structural VAR for the full Canadian economy using quarterly LEAP/LEED-based creation and destruction series, with an expanded variable set including commodity price indices to separately identify resource-sector allocative shocks — publishable in *Canadian Journal of Economics* or *Journal of Monetary Economics* |

---

<a name="paper-5"></a>
## Paper 5: Lazear & Spletzer (2012)

**Full Citation:** Lazear, Edward P. and James R. Spletzer. "Hiring, Churn, and the Business Cycle." *American Economic Review: Papers & Proceedings* 102(3): 575–579, May 2012.

---

### 1. Research Question

How does employment churn — the simultaneous hiring and separation within a business that offsets each other without changing net employment — vary over the business cycle, and what role did changes in churn play in the collapse of hiring during the 2007–09 Great Recession?

### 2. Motivation

Standard analyses of the labor market during the Great Recession focused on net employment — the dramatic fall in payrolls — and on job creation and destruction. But these net measures obscure a potentially important channel: the cessation of *churn*. Even businesses that are not changing their employment level engage in substantial ongoing hiring and separation activity — workers quit, are hired as replacements, transfer, or retire. This churn is intrinsically valuable: it enables workers to move to more productive jobs and enables firms to replace mismatched workers. If churn collapses during recessions, labor market efficiency losses may substantially exceed what net employment changes alone reveal. Lazear and Spletzer construct the first explicit churn decomposition from JOLTS microdata to quantify this channel.

### 3. Main Contribution

The paper introduces an explicit accounting decomposition of total hires and separations into four components — growth hires (H^G_E), replacement hires (churn in expanding firms), replacement separations (churn in contracting firms), and employment-decreasing separations — and uses JOLTS microdata to estimate each component quarterly. The key finding is that churn is (i) procyclical (correlation with unemployment rate = −0.96); (ii) quantitatively enormous (65% of all hires during the mid-2000s were churn); and (iii) the dominant component of the hiring collapse during the 2007–09 recession (79% of the decline in hires was due to reduced churn, not reduced job creation).

### 4. Relationship to the Literature

The paper fits into the wider gross flows literature initiated by DH1992 but focuses on a different decomposition: churn (within-firm turnover) rather than job creation/destruction (across-firm flows). It is related to Anderson-Meyer (1994), Burgess-Lane-Stevens (2000), and Davis-Faberman-Haltiwanger (2006), who had estimated that 42–70% of hiring was churn using various data sources. The paper's contribution is to use the JOLTS *microdata* — enabling the within-establishment decomposition — rather than cross-sectional tabulations, and to examine the business-cycle variation directly. The churn concept is distinct from but related to the "excess reallocation" concept in DH1992 (the part of gross flows not required for net employment changes).

### 5. Theoretical Framework / Economic Mechanism

**Accounting framework:** For an establishment, hires H and separations S can be decomposed as:
```
H = H^G_E + CH    (hires = growth hires + churn)
S = S^D_C + CH    (separations = employment-decreasing seps + churn)
```
where churn CH = min(H, S) within the establishment — the hires/separations that offset each other. Net employment change:
```
H - S = H^G_E - S^D_C
```
Churn does not directly affect net employment. In expanding businesses, churn = replacement hires (CHE = H^R_E = SE). In contracting businesses, churn = replacement separations (CHC = HC = S^R_C). In zero-growth businesses, churn = all hires/separations (CHZ = HZ = SZ).

**Two cyclical mechanisms:**
1. In downturns, separations that would have been matched by replacement hires remain unfilled → churn falls as unfilled separations become employment-decreasing separations.
2. Workers become reluctant to quit in recessions (job search declines) → quit rate falls → fewer replacement hires needed → churn falls through a different channel.

Both mechanisms predict procyclical churn.

### 6. Data

- **Dataset:** JOLTS (Job Openings and Labor Turnover Survey) microdata
- **Coverage:** Random sample of ~16,000 business establishments (nonfarm economy); ~10,500 provide data regularly
- **Period:** December 2000 – June 2011 (quarterly aggregation of monthly data)
- **Key feature:** JOLTS microdata allow classification of each establishment by its net employment change each quarter (expanding, contracting, zero-growth), enabling decomposition of total hires and separations into the four components of the framework
- **Limitation:** The paper explicitly excludes imputed hires and separations for unobserved births and deaths, so estimates are lower bounds on total flows; the paper's quarterly estimates of total hires (~12 million in mid-2000s) are below published monthly statistics (~15 million) partly for this reason

### 7. Empirical Strategy

Pure descriptive decomposition. The strategy is:
1. Classify each JOLTS establishment in each quarter as expanding (ΔE > 0), contracting (ΔE < 0), or zero-growth (ΔE = 0)
2. Within each category, compute hires and separations using the JOLTS microdata
3. Apply the churn accounting identities to decompose total hires H and separations S into their four components
4. Compute seasonally adjusted time series for each component (Figure 1)
5. Formally decompose the change in churn from 2007:Q4 to 2009:Q1 into: (a) change in the number of establishments with churn; (b) change in average size of churn conditional on having churn (Table 1)

### 8. Identification Strategy

**No causal identification.** This is a descriptive accounting exercise. The decomposition is an identity, not a regression. The paper makes no claim that churn *causes* employment changes or that the recession *caused* the decline in churn — it documents the accounting fact that most of the decline in hires during the 2007–09 recession was attributable to a decline in churn. The welfare implications (that reduced churn carries a cost of approximately 0.4 percentage points of GDP annually) rely on auxiliary assumptions about the productivity value of worker reallocation via churn, not on causal identification.

### 9. Main Results

**Stylized facts about churn:**
- Churn averages ~65% of total hires during 2001–2011 (consistent with prior estimates of 42–70%)
- Correlation between churn and unemployment rate: −0.96 (extremely procyclical)
- Correlation between churn and net employment growth: +0.43 (over 2001–2011:Q2); +0.79 (over 2001–2009:Q2)

**Great Recession:**
- Churn fell from 8.3 million in 2007:Q4 to 5.3 million in 2009:Q2 — a decline of 3.0 million (36%) over 6 quarters
- Total hires fell by 3.8 million over the same period
- **79% of the decline in hires was due to reduced churn**; only ~25% was due to reduced job creation (H^G_E)

**Decomposition of the churn decline (2007:Q4 to 2009:Q1, Table 1):**
- Number of establishments with churn: fell from 1.9 million to 1.6 million (−16%)
- Average churn size per churning establishment: fell from 4.44 to 3.78 (−15%)
- Formal decomposition: 52% of the total churn decline due to fewer establishments with churn; 48% due to smaller average churn within churning establishments

**Cost estimate:**
- Lazear and Spletzer estimate the cost of reduced churn at approximately 0.4 percentage points of GDP annually over the 3.5 years since the start of the recession
- This estimate uses the assumption that churn-driven worker reallocation raises productivity by the observed average productivity differences between firms that gain and lose workers

### 10. Economic Magnitude and Interpretation

The finding that 79% of the Great Recession's hiring collapse was due to reduced churn (not reduced job creation) is the headline result and represents a major reframing of what happened in the 2007–09 recession. Standard analyses focused on job creation (H^G_E) collapsing and job destruction (S^D_C) rising. The Lazear-Spletzer finding says: yes, those things happened, but they were quantitatively swamped by the simultaneous collapse of the replacement-hire/quit mechanism. Workers stopped quitting, so firms stopped replacing quitters. The economy became *frozen* rather than collapsing in the traditional sense. The implied welfare cost (0.4% of GDP annually) is substantial and persistent — if reduced churn represents forgone efficient reallocation, these are real productivity losses.

### 11. Mechanisms

Two mechanisms are empirically consistent with the data but the paper cannot distinguish between them:

1. **Supply side (worker reluctance):** Workers become reluctant to quit in recessions (fear of being unable to find new employment), so the quit rate falls. This reduces replacement hiring — even at firms that would gladly replace a quitter with a more productive worker — because there are fewer separations to replace.

2. **Demand side (employer frugality):** Employers, when a worker separates, choose not to replace them — instead tolerating the temporary gap in staffing. This mechanism is dominant according to the paper: "separations that would have been matched by hiring during good times remain unfilled." This interpretation implies that the causal chain runs from the aggregate shock → employer decision to leave separations unfilled → reduced churn.

The 52/48 split between fewer establishments with churn and smaller average churn is consistent with both mechanisms, as both would reduce churn at the extensive and intensive margins.

### 12. Robustness Checks

This is a short P&P paper with limited space for formal robustness. The authors validate their JOLTS-based estimates against:
- Published JOLTS statistics (their hires/separations estimates track the published series)
- BLS Business Employment Dynamics (their job creation/destruction estimates track BED data)
- Prior estimates of the churn share (consistent with Anderson-Meyer 1994; Burgess-Lane-Stevens 2000; Davis et al. 2006)

The paper notes that their quarterly estimates understate true flows because they exclude births/deaths imputation — but this is a consistent understatement and does not affect the proportional decomposition.

### 13. Limitations

1. **JOLTS sample:** JOLTS covers ~10,500 establishments — far fewer than the universe of U.S. businesses. The sample is disproportionately larger businesses. Small businesses, which tend to have higher churn rates, may be underrepresented.
2. **Short time series:** The JOLTS microdata begin in December 2000, providing only one full business cycle (the 2001 recession is only partially captured at the start). The paper covers only 2001–2011.
3. **No worker-level data:** Churn is measured at the establishment level. It is impossible to identify whether the workers hired as replacements are the same or different workers from those who separated. This matters for productivity analysis — efficient churn involves replacing low-productivity workers with high-productivity ones, not simply rehiring the same people.
4. **Nonfarm private sector only:** Government employment is excluded from JOLTS; education and health services differ substantially in their quit behaviour.
5. **Causality not established:** The paper documents the accounting fact that churn declined. Whether this represents an efficiency loss or a rational adjustment by workers and firms to changed incentives is not answered.
6. **P&P format:** As a 5-page Papers & Proceedings paper, many analytical details are necessarily compressed. This is a short report of findings rather than a full research paper.

### 14. Policy Implications

- If 79% of the Great Recession's hiring collapse was churn-related rather than job-creation-related, then policies designed to stimulate job creation (investment tax credits, hiring subsidies) would have addressed only ~25% of the hiring shortfall.
- Policies that encourage worker mobility (portable benefits, reductions in the non-wage costs of switching jobs) would target the mechanism directly.
- The estimated cost of 0.4% of GDP annually from reduced churn provides a rough welfare benchmark for evaluating policies that restore labor market fluidity.
- The finding suggests that aggregate demand stimulus might restore churn partly by restoring worker confidence to quit — a labour supply channel that is distinct from the job creation/destruction channel.

### 15. Overall Assessment

This is an insightful, well-executed descriptive paper that reframes a key fact about the Great Recession in a useful way. The accounting decomposition is clean and the empirical finding is striking. Its limitations as a short P&P paper are acknowledged: the paper establishes a stylized fact rather than a causal mechanism, and the welfare calculation rests on auxiliary assumptions that are not formally derived. The paper raises more questions than it answers — the mechanisms behind the churn collapse, the welfare implications, the heterogeneity across industries and workers — which is entirely appropriate for a conference proceedings contribution. It motivates a more complete follow-up paper that would use worker-level data to identify whether churn involves efficient reallocations.

**Quality: Good for its format. Concise, clear, empirically novel, and policy-relevant.**

### 16. Relevance to My Research

Very relevant for RDC work on Canadian labour dynamics. The JOLTS-based decomposition could be replicated using Canadian administrative data (LEED or the Longitudinal Worker File), which allows similar classification of establishments by their employment direction. The hypothesis that churn is procyclical and was severely disrupted during the 2008–09 recession (and the COVID-19 pandemic) in Canada could be tested directly. Of particular interest would be whether the sectoral composition of churn collapse differs in Canada — given the resource sector's sensitivity to commodity cycles, one might expect churn dynamics in Alberta and Saskatchewan to differ sharply from Ontario and Québec during commodity busts.

### 17. Potential Research Extensions

- Replicate the Lazear-Spletzer decomposition for Canada using LWF/LEED data for 2000–2024, covering the 2008–09 recession and the COVID-19 shock
- Disaggregate churn by industry, province, worker age, and occupation to identify which segments of the Canadian labour market experienced the largest efficiency losses from churn collapse
- Estimate a structural model of the quit/hire decision to formally identify whether the 2008–09 churn collapse in Canada was supply-driven (workers reluctant to quit) or demand-driven (employers declining to replace quitters)

### 18. Research Gaps

- The paper uses establishment-level data but cannot identify whether churn involves high-to-low or low-to-high productivity transitions. A key question is whether *efficient* churn collapsed during the recession or whether the decline was concentrated in inefficient (mismatch-correcting) turnover.
- The cost estimate (0.4% of GDP/year) is rough and does not account for the possibility that some churn during booms was excessive (overhiring/overquitting driven by optimism), so not all lost churn represents an efficiency loss.

### 19. Methodological Lessons

1. A simple accounting decomposition can reveal economically important facts that are invisible in aggregate statistics — the 79% finding emerges directly from the churn accounting identity applied to microdata and would be invisible in aggregate employment or JOLTS-level statistics.
2. Classifying establishments by employment direction (expanding, contracting, zero-growth) within each period, rather than by long-run growth status, is essential for implementing the churn decomposition correctly.
3. Validating microdata-based estimates against published aggregate statistics (BED, published JOLTS) provides reassurance that the microdata classifications are consistent with external benchmarks.

---

### Five-Sentence Summary

Lazear and Spletzer (2012) use JOLTS establishment microdata to decompose total hires and separations into four components: growth hires (job creation), employment-decreasing separations (job destruction), and churn (replacement hires and separations that offset each other within a firm without changing net employment). They show that churn accounts for approximately 65% of all hiring in normal times and is strongly procyclical, with a correlation of −0.96 with the unemployment rate over 2001–2011. During the 2007–09 Great Recession, churn fell by 3.0 million workers per quarter (36% decline), and this churn collapse accounts for 79% of the total decline in hiring — far larger than the decline in job creation (H^G_E). The decline in churn was evenly split between fewer establishments experiencing any churn (52%) and smaller average churn among those that did experience it (48%), consistent with a combination of worker reluctance to quit and employer decisions to leave separations unfilled. The welfare cost of this reduced churn — lost productivity from foregone efficient worker reallocation — is estimated at roughly 0.4 percentage points of GDP annually over the post-recession period, highlighting that the efficiency costs of recessions substantially exceed those revealed by net employment changes alone.

| | |
|---|---|
| **Key contribution** | First explicit churn decomposition from JOLTS microdata; documents that 79% of the Great Recession's hiring collapse was churn-driven, not job-creation-driven — fundamentally reframing the labour market contraction |
| **Key weakness** | Short P&P format; no causal identification; cannot distinguish supply-side (reluctant quitters) from demand-side (non-replacing employers) mechanisms; no worker-level data to identify productivity effects of churn |
| **Most interesting research gap** | Whether the churn collapse was efficient (eliminating mismatch-driven excessive turnover) or inefficient (preventing productive reallocation) — the answer determines whether recession-period policy should try to restore churn or merely accept it as rational adjustment |
| **Publishable extension** | A full-length paper using Canadian LWF/LEED data to replicate the churn decomposition over 2000–2024, disaggregating by province, industry, age, and occupation, and formally testing the supply-side vs. demand-side mechanism using variation in provincial unemployment insurance generosity as an instrument for worker quit behaviour |

---

*End of Batch 01 Summaries.*  
*Next batch (papers 6–10) should process: Hyatt & McEntarfer (2012), Acemoglu et al. (2018), Mueller (2017), Krusell et al. (2017), Carrillo-Tudela & Visschers (2023).*
