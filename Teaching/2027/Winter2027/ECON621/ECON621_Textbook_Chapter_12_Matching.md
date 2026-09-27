# Chapter 12: Matching and Selection on Observables

---

## Chapter Overview

Matching estimators provide an alternative to regression for estimating average treatment effects when treatment is not randomly assigned. The key assumption is **selection on observables (CIA — Conditional Independence Assumption)**: after conditioning on observed covariates, treatment is independent of potential outcomes. This chapter develops the theory and practice of matching, connects it to regression, and introduces propensity score methods.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. State the **Conditional Independence Assumption (CIA)** and explain what it requires.
2. Explain the **propensity score theorem** and why it simplifies matching.
3. Describe and implement **nearest-neighbor matching**.
4. Explain the connection between regression and matching.
5. Apply the **propensity score** for matching, weighting, and regression.
6. Check the **overlap (common support)** condition and deal with violations.
7. Evaluate the quality of matching using **balance checks**.
8. Discuss when matching is more or less appropriate than other methods.

---

## 12.1 The Conditional Independence Assumption (CIA)

**Definition 12.1 (Conditional Independence Assumption / Ignorability):**

$$\{Y_{0i}, Y_{1i}\} \perp\!\!\!\perp D_i \mid \mathbf{X}_i$$

Given observed covariates $\mathbf{X}_i$, the treatment $D_i$ is independent of potential outcomes. Conditioning on $\mathbf{X}_i$ "explains away" all selection into treatment.

This implies:

$$E[Y_{0i} \mid D_i = 1, \mathbf{X}_i = \mathbf{x}] = E[Y_{0i} \mid D_i = 0, \mathbf{X}_i = \mathbf{x}]$$

Within cells defined by $\mathbf{X}_i = \mathbf{x}$, treatment is effectively random.

**When is CIA plausible?**

The CIA is plausible when:
- Treatment assignment is driven by observable characteristics (e.g., eligibility rules based on measurable criteria).
- The researcher has rich data capturing all important determinants of selection.
- There are no hidden selection mechanisms (no selection on unobservables).

**When is CIA implausible?**
- Treatment is self-selected based on unobservable motivation or ability.
- Assignment rules are discretionary and based on unrecorded factors.
- There is reverse causality.

**Example 12.1:** A job training program recruits participants based on age, education, and prior employment status — all observable. If the data contains these variables, CIA may be plausible: conditional on observables, participants and non-participants are comparable.

---

## 12.2 The Overlap Condition

**Assumption 12.1 (Overlap / Common Support):**

$$0 < P(D_i = 1 \mid \mathbf{X}_i = \mathbf{x}) < 1 \quad \text{for all } \mathbf{x} \text{ in the support of } \mathbf{X}$$

Every individual, regardless of their covariate values, has a positive probability of being in both the treatment and control groups.

Overlap fails when:
- Some covariate values are found only among treated units (no valid control group members to compare to).
- Perfect predictors of treatment exist.

**Dealing with overlap violations:**
- Trim the sample to the common support region.
- Use only observations where propensity scores overlap between treatment and control.
- Report results with and without trimming; check sensitivity.

---

## 12.3 Sub-classification and Direct Matching

### 12.3.1 Sub-classification

The simplest matching approach: divide the sample into cells defined by discrete values of $\mathbf{X}_i$, estimate the treatment effect within each cell, then average across cells.

$$\hat{\tau}^{sub} = \sum_{\mathbf{x}} \hat{w}(\mathbf{x}) \left[\bar{Y}_{1}(\mathbf{x}) - \bar{Y}_{0}(\mathbf{x})\right]$$

where $\bar{Y}_{d}(\mathbf{x})$ is the mean outcome for group $d$ in cell $\mathbf{x}$, and $\hat{w}(\mathbf{x})$ is the fraction of the treatment group in cell $\mathbf{x}$.

**Problem:** With many continuous covariates, there may be no exact matches (the "curse of dimensionality"). Propensity score matching is the solution.

### 12.3.2 Nearest-Neighbor Matching

Match each treated unit to the control unit(s) with the most similar covariates (measured by distance in $\mathbf{X}$-space):

$$\hat{\tau}^{NNM} = \frac{1}{N_1} \sum_{i: D_i = 1} \left[Y_i - \frac{1}{|J(i)|}\sum_{j \in J(i)} Y_j\right]$$

where $J(i)$ is the set of matched control units for treated unit $i$.

**Key choices in nearest-neighbor matching:**
- **Distance metric:** Euclidean? Mahalanobis?
- **Number of matches $M$:** 1-to-1 or 1-to-$M$? More matches reduce variance but increase bias.
- **With or without replacement:** Matching with replacement reduces bias; without replacement is simpler.
- **Caliper:** Restrict matches to be within a maximum distance.

---

## 12.4 The Propensity Score Theorem

With many covariates, exact matching is impossible. Rosenbaum and Rubin (1983) showed that matching on a single scalar — the **propensity score** — suffices.

**Definition 12.2 (Propensity Score):**

$$p(\mathbf{x}) = P(D_i = 1 \mid \mathbf{X}_i = \mathbf{x})$$

The propensity score is the conditional probability of receiving treatment given observed covariates.

**Theorem 12.1 (Propensity Score Theorem, Rosenbaum and Rubin 1983):** If the CIA holds with $\mathbf{X}_i$, then it also holds conditional on $p(\mathbf{X}_i)$:

$$\{Y_{0i}, Y_{1i}\} \perp\!\!\!\perp D_i \mid p(\mathbf{X}_i)$$

**Why this is powerful:** Instead of matching on a $k$-dimensional covariate vector, we only need to match on a single number — the propensity score.

### 12.4.1 Estimating the Propensity Score

In practice, $p(\mathbf{x})$ is unknown and must be estimated. Common methods:
- **Logistic regression:** $\hat{p}(\mathbf{x}) = \frac{\exp(\mathbf{x}^T\hat{\boldsymbol{\gamma}})}{1 + \exp(\mathbf{x}^T\hat{\boldsymbol{\gamma}})}$
- **Probit regression**
- **Machine learning:** Random forests, LASSO (for high-dimensional $\mathbf{X}$)

---

## 12.5 Propensity Score Matching Estimators

### 12.5.1 Propensity Score Nearest-Neighbor Matching

Match each treated unit to the control unit with the closest propensity score:

$$\hat{\tau}^{PSM} = \frac{1}{N_1}\sum_{i: D_i=1}\left[Y_i - Y_{j(i)}\right]$$

where $j(i) = \arg\min_{j: D_j = 0} |p(\hat{\mathbf{X}}_i) - p(\hat{\mathbf{X}}_j)|$.

### 12.5.2 Inverse Probability Weighting (IPW)

An elegant alternative: weight observations by the inverse of the propensity score so that the reweighted control group "looks like" the treatment group.

$$\hat{\tau}^{IPW}_{ATT} = \frac{1}{N_1}\sum_{i=1}^n\left[D_i Y_i - \frac{(1-D_i)\hat{p}(\mathbf{X}_i)Y_i}{1-\hat{p}(\mathbf{X}_i)}\right]$$

**Intuition:** Control units with high propensity scores (similar to treated units) receive higher weight; those with very different characteristics receive low weight.

### 12.5.3 Doubly Robust Estimation

Modern practice combines propensity score weighting with regression — the **doubly robust** (DR) estimator:

$$\hat{\tau}^{DR}_{ATT} = \frac{1}{N_1}\sum_{i: D_i=1}\left[(Y_i - \hat{\mu}_0(\mathbf{X}_i))\right] + \frac{1}{N_1}\sum_{i: D_i=0}\frac{\hat{p}(\mathbf{X}_i)}{1-\hat{p}(\mathbf{X}_i)}\left[(Y_i - \hat{\mu}_0(\mathbf{X}_i))\right]$$

where $\hat{\mu}_0(\mathbf{X}_i)$ is the predicted untreated outcome from a regression model.

**Double robustness:** The DR estimator is consistent if **either** the propensity score model **or** the outcome regression model is correctly specified — but not necessarily both.

---

## 12.6 Regression as a Form of Matching

Regression and matching are deeply related. Under the CIA, both identify the ATT (or ATE). The difference lies in how they handle the comparison:

- **Regression** fits a global linear model and uses extrapolation.
- **Matching** compares treated units only to "nearby" controls (local comparison).

**Angrist and Pischke (2009)** show that OLS is a form of matching where each control observation receives a weight proportional to how much its $\mathbf{X}$ differs from the treatment group distribution.

**When does regression fail relative to matching?**

When there is poor overlap — the treatment and control groups have very different covariate distributions — regression extrapolates from the control group to predict untreated potential outcomes for treated units. This extrapolation can be badly wrong if the CEF is non-linear.

Matching avoids this by restricting comparisons to the common support.

---

## 12.7 Balance Checks and Assessment

The CIA requires that treatment and control groups are comparable after matching. **Balance checks** verify that the matched groups have similar covariate distributions.

**Formal balance check:** Test whether the mean (and sometimes distribution) of each covariate differs between treated and matched controls.

**Standardized Difference:**

$$\text{SDiff}_j = \frac{\bar{X}_{1j} - \bar{X}_{0j}}{\sqrt{(\hat{\sigma}^2_{1j} + \hat{\sigma}^2_{0j})/2}}$$

Values below 0.1 are generally considered good balance.

**Love plot:** A visual display of standardized differences before and after matching.

---

## 12.8 Practical Guidance: When to Match?

| Situation | Recommended approach |
|---|---|
| Rich observable data, CIA plausible | Propensity score matching or IPW |
| Concern about model extrapolation | Match first, then regress on matched sample |
| Many covariates, CIA uncertain | Add controls in regression; test sensitivity |
| CIA implausible (unobservables matter) | Use IV, DiD, or RDD instead |
| Extreme overlap problems | Match with caliper; report trimmed results |

---

## Chapter Summary

- **Matching** identifies causal effects by comparing treated and control units with similar observed covariates.
- The **CIA** (selection on observables) is the key identifying assumption: conditional on $\mathbf{X}$, treatment is independent of potential outcomes.
- The **overlap condition** requires that for every covariate value, both treated and control units exist.
- The **propensity score theorem** allows matching on a single scalar (the probability of treatment) instead of the full covariate vector.
- **Doubly robust estimators** are consistent if either the propensity score model or the outcome model is correct.
- **Regression is a form of matching** but extrapolates; matching restricts comparisons to the common support.
- **Balance checks** verify that matching has achieved covariate balance.
- CIA is a strong assumption. When unobservables matter, use IV, DiD, or RDD.

---

## Key Terms

**CIA (Conditional Independence Assumption)** — treatment is independent of potential outcomes given observed covariates.

**Overlap** — every unit has positive probability of receiving each treatment level.

**Propensity score** — $p(\mathbf{x}) = P(D=1 \mid \mathbf{X}=\mathbf{x})$.

**Propensity score theorem** — matching on the propensity score achieves CIA when matching on $\mathbf{X}$ does.

**Nearest-neighbor matching** — each treated unit is matched to the control unit(s) with the most similar propensity score.

**Inverse Probability Weighting (IPW)** — reweight control units by $p(\mathbf{X})/(1-p(\mathbf{X}))$.

**Doubly robust estimator** — consistent if either the propensity score model or the outcome model is correct.

**Balance check** — assessment of whether treatment and control groups have similar covariate distributions after matching.

**Standardized difference** — normalized measure of covariate balance.

---

## Exercises

### Conceptual Questions

**12.1** State the CIA. What does it require about the selection process? Give an example where it is plausible and one where it is not.

**12.2** Explain the propensity score theorem. Why is matching on the propensity score sufficient when CIA holds for the full vector $\mathbf{X}$?

**12.3** What is the overlap condition? What goes wrong when it fails?

**12.4** Explain double robustness. Why is it a desirable property?

**12.5** A researcher argues that regression and matching give the same estimates under CIA. Is this true? When might they differ?

### Applied Questions

**12.6** In R, estimate the average treatment effect of union membership on wages using propensity score matching. Steps:
(a) Estimate a logistic regression for treatment (union = 1) on observable controls.
(b) Compute the propensity score.
(c) Check overlap.
(d) Implement nearest-neighbor matching.
(e) Assess balance.
(f) Compute the ATT.

---

## R Lab 12: Matching and Propensity Scores

### Setup

```r
library(tidyverse)
library(MatchIt)    # matching
library(cobalt)     # balance assessment
library(WeightIt)   # IPW

data("lalonde", package = "MatchIt")  # LaLonde (1986) job training data
```

### Exercise 12.1: Descriptive Analysis

```r
# Summary statistics by treatment status
lalonde %>%
  group_by(treat) %>%
  summarise(
    n       = n(),
    age     = mean(age),
    educ    = mean(educ),
    re78    = mean(re78),
    .groups = "drop"
  )
```

### Exercise 12.2: Propensity Score Estimation

```r
# Estimate propensity score via logistic regression
ps_model <- glm(treat ~ age + educ + race + married + nodegree + re74 + re75,
                 data = lalonde, family = binomial)

lalonde$pscore <- predict(ps_model, type = "response")

# Check overlap
ggplot(lalonde, aes(x = pscore, fill = factor(treat))) +
  geom_density(alpha = 0.5) +
  labs(title = "Propensity Score Overlap", x = "Propensity Score", fill = "Treated") +
  theme_minimal()
```

### Exercise 12.3: Nearest-Neighbor Matching

```r
m_out <- matchit(treat ~ age + educ + race + married + nodegree + re74 + re75,
                 data = lalonde, method = "nearest", ratio = 1)
summary(m_out)

# Balance
bal.tab(m_out)
love.plot(m_out, threshold = 0.1)
```

### Exercise 12.4: ATT from Matched Sample

```r
# Compute ATT from matched data
matched_data <- match.data(m_out)
att_matching <- mean(matched_data$re78[matched_data$treat == 1]) -
                mean(matched_data$re78[matched_data$treat == 0])
cat("ATT (matching):", round(att_matching, 2), "\n")

# Compare to OLS
ols_att <- lm(re78 ~ treat + age + educ + race + married + nodegree + re74 + re75,
               data = lalonde)
cat("OLS estimate of treatment:", round(coef(ols_att)["treat"], 2), "\n")
```

### Exercise 12.5: IPW Estimator

```r
w_out <- weightit(treat ~ age + educ + race + married + nodegree + re74 + re75,
                   data = lalonde, method = "ps", estimand = "ATT")
summary(w_out)

# ATT via IPW regression
library(jtools)
lm_ipw <- lm(re78 ~ treat, data = lalonde, weights = w_out$weights)
cat("IPW ATT:", round(coef(lm_ipw)["treat"], 2), "\n")
```

---

*End of Chapter 12*

---

**References**

Rosenbaum, P. R., and Rubin, D. B. (1983). The central role of the propensity score in observational studies for causal effects. *Biometrika*, 70(1), 41–55.

LaLonde, R. J. (1986). Evaluating the econometric evaluations of training programs with experimental data. *American Economic Review*, 76(4), 604–620.

Angrist, J. D., and Pischke, J. (2009). *Mostly Harmless Econometrics*. Chapter 3.

Cunningham, S. (2021). *Causal Inference: The Mixtape*. Chapter 5.

Wooldridge, J. M. (2019). *Introductory Econometrics*. Chapter 21.
