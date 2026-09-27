# Chapter 11: Differences-in-Differences

---

## Chapter Overview

**Differences-in-Differences (DiD)** is the workhorse identification strategy of modern empirical economics. It exploits variation in the timing and geography of policy changes to estimate causal effects: we compare the change in outcomes over time for units that were exposed to a treatment (the "treatment group") to the change in outcomes over time for units that were not (the "control group"). The difference of these two differences is the DiD estimator.

The key identifying assumption is **parallel trends**: in the absence of treatment, the treatment and control groups would have followed the same trend over time. When this assumption holds, the DiD estimator is unbiased. Testing it — and understanding when it is plausible — is the central challenge of DiD research.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. Set up the **2×2 DiD framework** (two groups, two periods).
2. State the **parallel trends assumption** and explain its meaning.
3. Derive the **DiD estimator** from simple mean comparisons.
4. Formulate DiD as a **regression with interaction terms**.
5. Explain the role of **clustering** standard errors in DiD.
6. Use **event study plots** to assess parallel pre-trends.
7. Identify key threats to DiD validity: anticipation, policy endogeneity, compositional changes.
8. Describe the complications of **staggered DiD** and recent methodological advances.
9. Apply DiD to the Card and Krueger (1994) minimum wage study.

---

## 11.1 The 2×2 Differences-in-Differences Setup

### 11.1.1 Notation

Consider two groups and two time periods:
- **Groups:** $g \in \{0, 1\}$ where $g = 1$ is the treatment group, $g = 0$ is the control group.
- **Periods:** $t \in \{0, 1\}$ where $t = 0$ is the pre-treatment period, $t = 1$ is the post-treatment period.
- **Treatment:** Group 1 receives the treatment in period 1; group 0 never receives treatment.

We define potential outcomes $Y_{gt}(d)$: the mean outcome in group $g$, period $t$, if treatment status were $d$.

### 11.1.2 The Estimand

The object of interest is the **Average Treatment Effect on the Treated (ATT)** in the post-period:

$$\text{ATT} = E[Y_{i1}(1) - Y_{i1}(0) \mid g_i = 1]$$

This is the average effect of treatment on the treated units in the post-treatment period. The key challenge: we do not observe $Y_{i1}(0)$ for treated units — we need a counterfactual for what the treatment group's outcome would have been had they not been treated.

### 11.1.3 The Four Observed Cell Means

| Period | Control Group ($g=0$) | Treatment Group ($g=1$) |
|---|---|---|
| Pre ($t=0$) | $\bar{Y}_{00}$ | $\bar{Y}_{10}$ |
| Post ($t=1$) | $\bar{Y}_{01}$ | $\bar{Y}_{11}$ |

---

## 11.2 The Parallel Trends Assumption

**Assumption 11.1 (Parallel Trends):**

$$E[Y_{t}(0) \mid g=1, t=1] - E[Y_{t}(0) \mid g=1, t=0] = E[Y_{t}(0) \mid g=0, t=1] - E[Y_{t}(0) \mid g=0, t=0]$$

In words: **in the absence of treatment, the treatment group would have experienced the same change in outcomes as the control group.**

This does NOT require the two groups to start at the same level. It only requires them to share the same time trend in untreated potential outcomes.

**Visual test:** Plot outcome trends for both groups in the pre-treatment periods. If the two groups have similar pre-trends (parallel), the assumption is more credible.

---

## 11.3 The DiD Estimator

### 11.3.1 Deriving the Estimator

The observed outcome for a treated unit in the post-period is:

$$E[Y_{i1} \mid g_i = 1, t=1] = E[Y_{i1}(1) \mid g_i = 1]$$

We need $E[Y_{i1}(0) \mid g_i = 1]$ — the counterfactual. Under parallel trends:

$$E[Y_{i1}(0) \mid g_i = 1] = E[Y_{i0}(0) \mid g_i = 1] + \underbrace{(E[Y_{t}(0) \mid g=0, t=1] - E[Y_{t}(0) \mid g=0, t=0])}_{\text{control group trend}}$$

$$= \bar{Y}_{10} + (\bar{Y}_{01} - \bar{Y}_{00})$$

Therefore:

$$\text{ATT} = E[Y_{i1}(1) \mid g_i=1] - E[Y_{i1}(0) \mid g_i=1]$$

$$= \bar{Y}_{11} - \left[\bar{Y}_{10} + (\bar{Y}_{01} - \bar{Y}_{00})\right]$$

$$= \boxed{(\bar{Y}_{11} - \bar{Y}_{10}) - (\bar{Y}_{01} - \bar{Y}_{00})}$$

**This is the DiD estimator:** the difference in before-after changes between the treatment and control groups.

### 11.3.2 Decomposing the DiD

$$\hat{\delta}^{DiD} = \underbrace{(\bar{Y}_{11} - \bar{Y}_{10})}_{\text{Change in treatment group}} - \underbrace{(\bar{Y}_{01} - \bar{Y}_{00})}_{\text{Change in control group}}$$

| Comparison | What it measures |
|---|---|
| $(\bar{Y}_{11} - \bar{Y}_{10})$ | Pre-post change for treated group = Treatment effect + Time trend |
| $(\bar{Y}_{01} - \bar{Y}_{00})$ | Pre-post change for control group = Time trend |
| DiD | Treatment effect (time trend differenced out) |

The control group provides the counterfactual trend. Subtracting it removes the common time trend, leaving only the causal effect.

### 11.3.3 Identification Under Parallel Trends

**Proposition 11.1:** Under Assumption 11.1 (Parallel Trends) and the overlap condition ($P(g=1) > 0$, $P(g=0) > 0$):

$$\hat{\delta}^{DiD} \xrightarrow{p} \text{ATT}$$

---

## 11.4 DiD as a Regression

The DiD estimator has a natural regression formulation.

**Regression DiD:**

$$Y_{igt} = \alpha + \beta_g G_i + \beta_t T_t + \delta (G_i \times T_t) + u_{igt}$$

where:
- $G_i = 1$ if unit $i$ is in the treatment group
- $T_t = 1$ if period $t$ is the post-treatment period
- $G_i \times T_t$ is the interaction term

**Interpreting coefficients:**

| Group | Period | $E[Y]$ |
|---|---|---|
| Control ($G=0$) | Pre ($T=0$) | $\alpha$ |
| Control ($G=0$) | Post ($T=1$) | $\alpha + \beta_t$ |
| Treatment ($G=1$) | Pre ($T=0$) | $\alpha + \beta_g$ |
| Treatment ($G=1$) | Post ($T=1$) | $\alpha + \beta_g + \beta_t + \delta$ |

Therefore:
- $\beta_g$: pre-existing level difference between treatment and control.
- $\beta_t$: common time trend (post-pre change for the control group).
- $\delta$: the **DiD estimator** — the additional change for the treatment group in the post period = **ATT under parallel trends**.

**Verification:** $\delta = (\alpha + \beta_g + \beta_t + \delta) - (\alpha + \beta_t) - (\alpha + \beta_g) + \alpha = \hat{\delta}^{DiD}$. ✓

### 11.4.1 With Additional Controls

To increase precision and relax the parallel trends assumption:

$$Y_{igt} = \alpha_g + \gamma_t + \delta (G_i \times T_t) + \mathbf{X}_{igt}^T \boldsymbol{\theta} + u_{igt}$$

where $\alpha_g$ are group fixed effects, $\gamma_t$ are time fixed effects, and $\mathbf{X}_{igt}$ are time-varying controls.

**Note:** With multiple time periods and groups, this becomes the **two-way fixed effects DiD** model of Chapter 10.

---

## 11.5 Standard Errors in DiD: Clustering

Standard errors in DiD settings need careful treatment. The treatment is typically assigned at the group level (e.g., a state adopts a policy), but outcomes are measured at the individual level. This creates **within-group correlation** in residuals that, if ignored, leads to severely underestimated standard errors.

**Bertrand, Duflo, and Mullainathan (2004)** showed that ignoring clustering can lead to rejection rates of 45% at the nominal 5% level when the true effect is zero.

**Solution:** Always cluster standard errors at the level of treatment assignment (e.g., state, school, firm).

**Rule:** Cluster at the group × time level that the policy variation comes from. If treatment varies at the state level, cluster at the state level even if outcomes are at the individual level.

---

## 11.6 Testing Parallel Trends: Event Study Plots

The parallel trends assumption is the key identifying assumption of DiD. While it cannot be directly tested (we never observe the counterfactual trend for the treatment group), we can assess its plausibility using **pre-treatment trends**.

### 11.6.1 The Event Study Specification

Replace the single post-period interaction with a set of interactions for each time period:

$$Y_{igt} = \alpha_g + \gamma_t + \sum_{k \neq -1} \delta_k (G_i \times \mathbb{1}[t=k]) + \mathbf{X}_{igt}^T\boldsymbol{\theta} + u_{igt}$$

where $k$ indexes periods relative to the treatment date, and $k = -1$ is the omitted (reference) period just before treatment.

**The $\delta_k$ coefficients:**
- For $k < 0$ (pre-treatment): should be zero if parallel trends holds.
- For $k \geq 0$ (post-treatment): these are the dynamic treatment effects.

**Event study plot:** Plot $\hat{\delta}_k$ with confidence intervals against time $k$. If pre-treatment coefficients are near zero (statistically and practically), parallel trends is more plausible.

### 11.6.2 Caution: Pre-trends Tests Are Noisy

Even if the parallel trends assumption holds, pre-trends tests have low power with few pre-treatment periods. Conversely, a non-significant pre-trend test does not guarantee that parallel trends holds. The test is necessary but not sufficient evidence.

---

## 11.7 Threats to DiD Validity

### 11.7.1 Violation of Parallel Trends

The most common threat. If treatment group would have experienced a different trend even without treatment, the DiD estimate is biased.

**Example:** If firms that adopt a new technology (treatment) were on a faster growth trajectory before adoption, the DiD estimator confounds the treatment effect with the pre-existing growth differential.

**Mitigation:** Use multiple pre-treatment periods to document parallel pre-trends; use control groups that are more similar to the treatment group.

### 11.7.2 Anticipation Effects

If treated units change behavior in anticipation of the treatment before it officially begins, the pre-treatment outcomes are already affected by the treatment. This biases the DiD downward (understates the total effect).

**Example:** A minimum wage increase announced 6 months before it takes effect. Firms may start adjusting employment before the law takes effect.

**Mitigation:** Extend the pre-treatment window to see if anticipation effects appear.

### 11.7.3 Policy Endogeneity

The treatment is often adopted in response to current or expected outcomes. If states with declining fast-food employment adopt a minimum wage increase, the control group (states with stable employment) will show different trends.

**Mitigation:** Find settings where treatment assignment is exogenous — natural experiments, sharp rules, randomized rollouts.

### 11.7.4 Compositional Changes

If the composition of the treatment and control groups changes over time (e.g., selective migration in response to a policy), the pre-post comparison may reflect composition changes rather than treatment effects.

---

## 11.8 Staggered DiD and Recent Advances

### 11.8.1 Staggered Treatment Adoption

In many real settings, different units adopt treatment at different times (staggered rollout). For example, US states adopt a minimum wage increase in different years.

The two-way FE estimator in this setting can be written as:

$$Y_{it} = \alpha_i + \gamma_t + \delta D_{it} + u_{it}$$

where $D_{it} = 1$ if unit $i$ is treated by period $t$.

**Problem:** Recent work (Callaway and Sant'Anna, 2021; Goodman-Bacon, 2021; de Chaisemartin and D'Haultfoeuille, 2020) has shown that in staggered DiD settings, the two-way FE $\delta$ is a weighted average of 2×2 DiD estimates, but with **potentially negative weights**. If treatment effects are heterogeneous (vary over time or across groups), the two-way FE estimate can be a misleading average or even have the wrong sign.

### 11.8.2 Solutions

Modern approaches decompose the staggered DiD into a series of 2×2 comparisons:

- **Callaway and Sant'Anna (2021):** Compute group-time average treatment effects $ATT(g,t)$ for each adoption cohort $g$ and time period $t$, then aggregate.
- **Sun and Abraham (2021):** Introduce a fully saturated interaction model.
- **de Chaisemartin and D'Haultfoeuille (2020):** Propose the "did_multiplegt" estimator robust to heterogeneous effects.

---

## 11.9 Empirical Illustration: Card and Krueger (1994)

### 11.9.1 The Research Question

In April 1992, New Jersey raised its minimum wage from \$4.25 to \$5.05 per hour. Pennsylvania did not change its minimum wage. Card and Krueger (1994) use this natural experiment to study the effect of the minimum wage increase on fast-food employment.

**Treatment group:** Fast-food restaurants in New Jersey.  
**Control group:** Fast-food restaurants in eastern Pennsylvania.  
**Pre-treatment period:** February 1992.  
**Post-treatment period:** November 1992.

### 11.9.2 Identification

The parallel trends assumption requires that, absent the New Jersey minimum wage increase, employment trends in New Jersey and Pennsylvania fast-food restaurants would have been similar.

**Plausibility:** New Jersey and Pennsylvania are geographically contiguous, compete in similar labor markets, and have similar industry mix. This makes parallel trends more plausible than comparing New Jersey to, say, California.

### 11.9.3 Results

| | New Jersey (treatment) | Pennsylvania (control) | DiD |
|---|---|---|---|
| Feb (pre) | 20.44 employees | 23.33 employees | — |
| Nov (post) | 21.03 employees | 21.17 employees | — |
| Change | +0.59 | −2.16 | **+2.76** |

**DiD estimate:** $0.59 - (-2.16) = 2.76$ additional full-time equivalent employees in New Jersey restaurants.

This suggests the minimum wage increase actually *increased* employment in New Jersey fast-food restaurants — directly contrary to the standard competitive model prediction.

**Why?** Card and Krueger argue: (1) fast-food labor markets are monopsonistic, so minimum wages can increase employment; (2) the positive effect might reflect the positive income effect on low-wage households increasing demand for fast food.

### 11.9.4 Criticism and Response

**Neumark and Wascher (1994)** challenged the results using payroll data (vs. Card-Krueger's phone survey data). Their estimates showed negative employment effects.

**Methodological lesson:** The choice of data source, control group, and period significantly affects DiD estimates. Always subject your design to sensitivity checks.

---

## Chapter Summary

- **DiD** compares the change in outcomes before and after treatment for treated units versus control units.
- The **parallel trends assumption** is the key identifying assumption: control group trend serves as the counterfactual for the treatment group.
- **DiD regression:** $Y = \alpha + \beta_g G + \beta_t T + \delta(G \times T) + u$; the coefficient $\delta$ is the ATT.
- **Event study plots** assess pre-treatment parallel trends — necessary but not sufficient evidence.
- **Cluster standard errors** at the level of treatment assignment; ignoring clustering severely understates uncertainty.
- Key threats: violations of parallel trends, anticipation effects, policy endogeneity, compositional changes.
- **Staggered DiD** settings require caution: two-way FE can have wrong-sign weights under heterogeneous effects.
- **Card and Krueger (1994)** is the canonical DiD application, showing minimum wages may not reduce fast-food employment.

---

## Key Terms

**Differences-in-Differences (DiD)** — $(\bar{Y}_{11} - \bar{Y}_{10}) - (\bar{Y}_{01} - \bar{Y}_{00})$; the change in outcomes for the treated group minus the change for the control group.

**Parallel trends assumption** — in the absence of treatment, treated and control groups would have experienced the same trend.

**ATT (DiD context)** — $E[Y_{i1}(1) - Y_{i1}(0) \mid g_i = 1]$; effect of treatment on treated units in the post-period.

**Event study** — regression estimating dynamic treatment effects before and after treatment.

**Pre-trends test** — testing whether pre-treatment DiD coefficients are zero; assesses parallel trends plausibility.

**Staggered DiD** — DiD with variation in timing of treatment adoption across units.

---

## Exercises

### Conceptual Questions

**11.1** State the parallel trends assumption in your own words. Why is it called "parallel"?

**11.2** Explain why the DiD estimator is not simply the before-after change for the treatment group.

**11.3** A researcher uses DiD to study the effect of a state-level policy on individual outcomes. She has 50 states and 10,000 individual observations. Should she cluster at the individual or state level? Why?

**11.4** Describe an event study plot. What would you conclude from (a) flat pre-trends with a jump at treatment; (b) rising pre-trends in the treatment group before treatment?

**11.5** Explain the "negative weights" problem in staggered DiD. Why is the two-way FE estimator potentially misleading?

### Analytical Questions

**11.6** Using the Card-Krueger data in the table above, compute the DiD estimate by hand.

**11.7** Show that the OLS coefficient on $G_i \times T_t$ in the regression $Y = \alpha + \beta_g G + \beta_t T + \delta (G \times T) + u$ equals the DiD estimator.

**11.8** Suppose parallel trends fails: the treatment group would have grown by 3% in the post-period even without treatment, while the control group grows by 1%. The observed DiD is 5%. What is the true ATT?

### Applied Questions

**11.9** Using publicly available Card-Krueger data, replicate their DiD estimate in R.

**11.10** Generate event study plots for a dataset with multiple pre-treatment periods.

---

## R Lab 11: Differences-in-Differences

### Setup

```r
library(tidyverse)
library(fixest)   # fast fixed effects with robust SE
library(ggplot2)

# Simulate DiD data
set.seed(42)
n_units <- 200    # 100 treatment, 100 control
n_periods <- 6    # periods -3, -2, -1 (pre) and 0, 1, 2 (post)

df <- expand.grid(
  unit = 1:n_units,
  period = -3:2
) %>%
  as_tibble() %>%
  mutate(
    treated    = unit > 100,                     # 101-200 are treated
    post       = period >= 0,                    # periods 0,1,2 are post
    time_trend = 0.5 * period,                   # common linear time trend
    unit_fe    = rnorm(n_units)[unit],           # unit-specific fixed effect
    te         = ifelse(treated & post, 3, 0),   # true ATT = 3
    noise      = rnorm(n_units * n_periods, 0, 1.5),
    Y          = 10 + unit_fe + time_trend + te + noise
  )
```

### Exercise 11.1: Visualizing Parallel Trends

```r
df %>%
  group_by(treated, period) %>%
  summarise(mean_Y = mean(Y), .groups = "drop") %>%
  ggplot(aes(x = period, y = mean_Y, color = treated, group = treated)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  geom_vline(xintercept = -0.5, linetype = "dashed", color = "gray50") +
  labs(
    title    = "Outcome Trends: Treatment vs. Control Group",
    subtitle = "Dashed line = treatment date. Pre-trends look parallel.",
    x = "Period", y = "Mean Outcome",
    color = "Treated"
  ) +
  theme_minimal()
```

### Exercise 11.2: The 2×2 DiD

```r
# Use only pre (-1) and post (0) periods
df_2x2 <- df %>% filter(period %in% c(-1, 0))

# Cell means
cell_means <- df_2x2 %>%
  group_by(treated, post) %>%
  summarise(mean_Y = mean(Y), .groups = "drop")
print(cell_means)

# DiD by hand
did_manual <- with(cell_means,
  (mean_Y[treated == TRUE  & post == TRUE]  -
   mean_Y[treated == TRUE  & post == FALSE]) -
  (mean_Y[treated == FALSE & post == TRUE]  -
   mean_Y[treated == FALSE & post == FALSE])
)
cat("DiD estimate (manual):", round(did_manual, 3), "\n")

# DiD via regression
did_reg <- lm(Y ~ treated * post, data = df_2x2)
summary(did_reg)
```

### Exercise 11.3: Regression DiD with Fixed Effects

```r
# Full panel DiD with unit and time fixed effects
fe_did <- feols(Y ~ i(post, treated) | unit + period,
                data = df, cluster = ~unit)
summary(fe_did)
cat("FE DiD estimate:", round(coef(fe_did)["post::TRUE:treatedTRUE"], 3), "\n")
```

### Exercise 11.4: Event Study Plot

```r
# Event study: dynamic treatment effects by period
event_study <- feols(Y ~ i(period, treated, ref = -1) | unit + period,
                     data = df, cluster = ~unit)

iplot(event_study,
      xlab = "Periods Relative to Treatment",
      main = "Event Study: Dynamic Treatment Effects",
      sub  = "Reference period = -1. Treatment begins at period 0.")
```

### Exercise 11.5: Card and Krueger Replication

```r
# Read Card-Krueger data (available at various sources)
# Here we use the 'wooldridge' package
# install.packages("wooldridge")
library(wooldridge)
data("fastfood", package = "wooldridge")

# DiD regression
ck_model <- lm(fte ~ nj + d + nj:d, data = fastfood)
summary(ck_model)
cat("DiD estimate (Card-Krueger):", round(coef(ck_model)["nj:d"], 3), "\n")
```

---

*End of Chapter 11*

---

**References**

Card, D., and Krueger, A. B. (1994). Minimum wages and employment: A case study of the fast-food industry in New Jersey and Pennsylvania. *American Economic Review*, 84(4), 772–793.

Bertrand, M., Duflo, E., and Mullainathan, S. (2004). How much should we trust differences-in-differences estimates? *Quarterly Journal of Economics*, 119(1), 249–275.

Angrist, J. D., and Pischke, J. (2009). *Mostly Harmless Econometrics*. Chapter 5.

Callaway, B., and Sant'Anna, P. H. C. (2021). Difference-in-differences with multiple time periods. *Journal of Econometrics*, 225(2), 200–230.

Goodman-Bacon, A. (2021). Difference-in-differences with variation in treatment timing. *Journal of Econometrics*, 225(2), 254–277.

Cunningham, S. (2021). *Causal Inference: The Mixtape*. Chapter 9.
