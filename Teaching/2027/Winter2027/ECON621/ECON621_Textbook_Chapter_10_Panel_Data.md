# Chapter 10: Panel Data and Fixed Effects

---

## Chapter Overview

Panel data — repeated observations on the same units over time — are among the most powerful data structures in applied economics. They allow researchers to control for **unobserved individual heterogeneity**: time-invariant characteristics of individuals, firms, or regions that are correlated with both the treatment variable and the outcome, but that we can never directly observe.

This chapter develops the **fixed effects (FE)** estimator, shows how it is related to OLS via the Frisch-Waugh-Lovell theorem, and discusses its assumptions, limitations, and extensions.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. Explain the **panel data structure** and define key terminology (balanced/unbalanced panels, $N$, $T$).
2. Explain the **unobserved heterogeneity problem** and why pooled OLS fails when individual effects are correlated with regressors.
3. Derive the **within (fixed effects) estimator** via demeaning.
4. Show that FE is equivalent to **LSDV (Least Squares Dummy Variables)**.
5. State the identifying assumption of FE and explain what it rules out.
6. Contrast the **first-differences estimator** with the within estimator.
7. Discuss the **random effects estimator** and the **Hausman test**.
8. Apply fixed effects to the Card (1995) earnings study.

---

## 10.1 Why Panel Data? The Unobserved Heterogeneity Problem

### 10.1.1 The Setup

Suppose we observe individual $i$ in periods $t = 1, 2, \ldots, T$. The outcome $Y_{it}$ depends on an observed regressor $X_{it}$ and an **unobserved individual effect** $\alpha_i$:

$$Y_{it} = \alpha_i + \beta X_{it} + u_{it} \tag{10.1}$$

where:
- $\alpha_i$ is a **time-invariant** unobserved characteristic of individual $i$ (e.g., innate ability, firm quality, state-specific resources).
- $u_{it}$ is an idiosyncratic error term.

### 10.1.2 The Pooled OLS Problem

If we ignore $\alpha_i$ and run OLS on the stacked dataset:

$$Y_{it} = \alpha + \beta X_{it} + v_{it}$$

where $v_{it} = \alpha_i - \alpha + u_{it}$, then OLS is biased if $\text{Cov}(X_{it}, \alpha_i) \neq 0$.

**Example 10.1:** Estimating the return to union membership ($X_{it}$) on wages ($Y_{it}$). $\alpha_i$ might be unobserved worker productivity — high-productivity workers are both more likely to be unionized and have higher wages independently of union membership. So $\text{Cov}(X_{it}, \alpha_i) > 0$, and pooled OLS overstates the union wage premium.

**Figure 10.1 Description:** Two plots side by side. Left: cross-sectional scatter of wages vs. union status — shows a positive slope. Right: within-person scatter of *changes* in wages vs. changes in union status — shows a different (smaller) slope. The difference is the bias from unobserved individual heterogeneity.

---

## 10.2 The Panel Data Model

**Definition 10.1 (One-Way Fixed Effects Model):**

$$Y_{it} = \alpha_i + \beta X_{it} + u_{it}$$

where $i = 1, \ldots, N$ and $t = 1, \ldots, T$.

**Key assumption (strict exogeneity within the panel):**

$$E[u_{it} \mid X_{i1}, X_{i2}, \ldots, X_{iT}, \alpha_i] = 0 \quad \text{for all } t$$

This says that, conditional on the individual effect $\alpha_i$, the idiosyncratic error is uncorrelated with regressors in all periods. This is stronger than requiring $E[u_{it} \mid X_{it}, \alpha_i] = 0$.

**No assumption on $\text{Cov}(X_{it}, \alpha_i)$:** Unlike pooled OLS, we allow the individual effect to be correlated with the regressors.

---

## 10.3 The Within (Fixed Effects) Estimator

### 10.3.1 Demeaning

The key insight: **subtract the individual time-mean** to remove $\alpha_i$.

For individual $i$, the time-mean of equation (10.1) is:

$$\bar{Y}_i = \alpha_i + \beta \bar{X}_i + \bar{u}_i$$

where $\bar{Y}_i = \frac{1}{T}\sum_{t=1}^T Y_{it}$, etc.

Subtracting from equation (10.1):

$$\underbrace{(Y_{it} - \bar{Y}_i)}_{\tilde{Y}_{it}} = \beta \underbrace{(X_{it} - \bar{X}_i)}_{\tilde{X}_{it}} + \underbrace{(u_{it} - \bar{u}_i)}_{\tilde{u}_{it}}$$

The individual effect $\alpha_i$ is eliminated. This is called the **within transformation** or **demeaning**.

### 10.3.2 The Within (FE) Estimator

**Definition 10.2 (Within Estimator):**

$$\hat{\beta}^{FE} = \left(\sum_{i=1}^N \sum_{t=1}^T \tilde{X}_{it}^2\right)^{-1} \sum_{i=1}^N \sum_{t=1}^T \tilde{X}_{it} \tilde{Y}_{it}$$

In matrix notation: $\hat{\boldsymbol{\beta}}^{FE} = (\tilde{\mathbf{X}}^T\tilde{\mathbf{X}})^{-1}\tilde{\mathbf{X}}^T\tilde{\mathbf{Y}}$, where $\tilde{\mathbf{Y}}$ and $\tilde{\mathbf{X}}$ are the demeaned outcome and regressor matrices.

This is **OLS on the demeaned (within-individual) data**.

### 10.3.3 Connection to the FWL Theorem

The within estimator is a special case of the FWL Theorem. Let $\mathbf{X}_1$ be the matrix of individual dummies (one per individual) and $\mathbf{X}_2 = X_{it}$. Then:

$$\hat{\beta}^{FE} = \hat{\beta}_2^{FWL} = (\tilde{\mathbf{X}}^T\tilde{\mathbf{X}})^{-1}\tilde{\mathbf{X}}^T\tilde{\mathbf{Y}}$$

where $\tilde{\mathbf{X}} = \mathbf{M}_{X_1}\mathbf{X}$ and $\tilde{\mathbf{Y}} = \mathbf{M}_{X_1}\mathbf{Y}$ are the residuals from projecting onto the individual dummy space — which is exactly demeaning.

### 10.3.4 Identifying Assumption of FE

**Assumption 10.1 (No Time-Varying Omitted Variables):**

The FE estimator is consistent if, conditional on the individual effect $\alpha_i$, there are no time-varying confounders correlated with $X_{it}$ in $u_{it}$.

**What FE controls for:** Any individual-specific, time-invariant unobservable.

**What FE cannot control for:** Time-varying confounders (variables that vary both across individuals and over time, and are correlated with $X_{it}$).

**Example of what FE handles:** Studying the effect of union membership on wages. FE removes the effect of permanent individual ability (time-invariant). What remains is the association between changes in union status and changes in wages, within the same individual over time.

**Example of what FE cannot handle:** Studying the effect of a new employment policy on wages, when individuals self-select into regions that adopt the policy at different times based on their expectations of local economic conditions (time-varying, endogenous selection).

---

## 10.4 The LSDV Representation

**Proposition 10.1 (LSDV Equivalence):** The within estimator is algebraically identical to the OLS estimator from a regression of $Y_{it}$ on $X_{it}$ and $N$ individual dummy variables (LSDV = Least Squares Dummy Variables):

$$Y_{it} = \sum_{j=1}^N \alpha_j D_{ij} + \beta X_{it} + u_{it}$$

where $D_{ij} = 1$ if $j = i$ (individual $i$'s dummy variable).

**Proof:** By the FWL theorem, the coefficient on $X_{it}$ from the LSDV regression equals the coefficient from regressing $\mathbf{M}_{X_1}\mathbf{Y}$ on $\mathbf{M}_{X_1}\mathbf{X}$, where $\mathbf{X}_1$ is the matrix of individual dummies. Projecting onto individual dummies means subtracting individual means — which is demeaning. $\square$

**Practical note:** With large $N$, LSDV is computationally expensive (requires inverting a large matrix). The within estimator is computationally equivalent but much faster.

---

## 10.5 The First-Differences Estimator

An alternative to demeaning is **first differencing**: subtract period $t-1$ from period $t$.

$$\Delta Y_{it} = \beta \Delta X_{it} + \Delta u_{it}$$

where $\Delta Y_{it} = Y_{it} - Y_{i,t-1}$, etc. Individual effects are again eliminated.

**FD estimator:** OLS on the first-differenced data.

**When FD ≡ FE:** When $T = 2$.

**When FD ≠ FE (T > 2):**
- Under strict exogeneity, both are consistent.
- If $u_{it}$ is serially uncorrelated, FE is more efficient.
- If $u_{it}$ follows a random walk ($u_{it} = u_{i,t-1} + \epsilon_{it}$), FD is more efficient.

---

## 10.6 Two-Way Fixed Effects

In many panel settings, we want to control for both individual effects AND time effects — for example, macro shocks that affect all individuals simultaneously.

**Two-way FE model:**

$$Y_{it} = \alpha_i + \gamma_t + \beta X_{it} + u_{it}$$

where $\gamma_t$ is a **time fixed effect** (common to all individuals in period $t$).

**Estimation:** Include individual and time dummies (LSDV) or demean by subtracting both individual means and time means (within transformation in two dimensions).

**Application:** The two-way FE model is the backbone of the **Differences-in-Differences** estimator studied in Chapter 11.

---

## 10.7 Random Effects and the Hausman Test

### 10.7.1 The Random Effects (RE) Model

**Definition 10.3 (Random Effects):** The RE model treats $\alpha_i$ as a random variable drawn from a distribution, uncorrelated with $X_{it}$:

$$\alpha_i \perp X_{it}$$

Under this assumption, OLS on the pooled data is consistent but inefficient (errors within individuals are correlated). The RE estimator uses a GLS transformation to achieve efficiency.

### 10.7.2 FE vs. RE: The Hausman Test

**Hausman (1978) Test:**

- Under $H_0$: $\text{Cov}(X_{it}, \alpha_i) = 0$ (RE is consistent and efficient; FE is consistent but inefficient).
- Under $H_1$: $\text{Cov}(X_{it}, \alpha_i) \neq 0$ (RE is inconsistent; FE is consistent).

The test statistic is:

$$H = (\hat{\boldsymbol{\beta}}^{FE} - \hat{\boldsymbol{\beta}}^{RE})^T \left[\text{Var}(\hat{\boldsymbol{\beta}}^{FE}) - \text{Var}(\hat{\boldsymbol{\beta}}^{RE})\right]^{-1} (\hat{\boldsymbol{\beta}}^{FE} - \hat{\boldsymbol{\beta}}^{RE}) \sim \chi^2_k$$

If $H$ is large (reject $H_0$), use FE. If not, RE may be preferred.

**Practical advice:** In applied economics, FE is used far more commonly than RE. The assumption that individual effects are uncorrelated with regressors is strong and often implausible. Use RE only when you have a strong theoretical reason to believe the assumption holds.

---

## 10.8 Empirical Illustration: Returns to Education (Card, 1995)

Card (1995) uses panel data to study whether the returns to education are different from OLS estimates once unobserved individual ability is controlled for.

**Data:** National Longitudinal Survey (NLS) following the same workers over time.

**Key finding:** FE estimates of the return to education are *higher* than OLS estimates — not lower, as ability bias would predict. This suggests that:

1. Men who complete more education may have had *lower* ability (conditional on measured characteristics) — a negative $\text{Cov}(X_{it}, \alpha_i)$.
2. Or: OLS ability bias is smaller than typically assumed, while measurement error in education attenuates OLS estimates downward.

This is a sobering finding: the "obvious" direction of ability bias may not be correct once we look within individuals over time.

---

## Chapter Summary

- **Panel data** allow us to control for time-invariant unobserved heterogeneity.
- **Pooled OLS** is biased when individual effects are correlated with regressors.
- The **within (FE) estimator** eliminates individual effects by demeaning; it is equivalent to OLS with individual dummies (LSDV).
- FE's identifying assumption is that there are no time-varying confounders; it controls for everything time-invariant but nothing that varies over time.
- The **first-differences estimator** is an alternative to FE; they are equivalent when $T = 2$.
- **Two-way FE** controls for both individual and time effects.
- The **Hausman test** helps choose between FE and RE, but FE is generally preferred in applied economics.
- Card (1995) shows FE can produce higher (not lower) estimates of returns to education — reversing the naive prediction about ability bias.

---

## Key Terms

**Panel data** — data with multiple observations per unit over time.

**Individual fixed effect** ($\alpha_i$) — time-invariant unobserved characteristic of unit $i$.

**Within transformation (demeaning)** — subtracting individual time-means.

**Within (FE) estimator** — OLS on demeaned data; eliminates individual effects.

**LSDV** — Least Squares Dummy Variables; OLS with individual dummies; algebraically equivalent to FE.

**First-differences (FD) estimator** — OLS on first-differenced data; also eliminates individual effects.

**Two-way FE** — controls for both individual and time effects.

**Random effects (RE)** — treats individual effects as random draws uncorrelated with regressors; more efficient but requires stronger assumptions.

**Hausman test** — tests whether $\text{Cov}(X_{it}, \alpha_i) = 0$; guides FE vs. RE choice.

---

## Exercises

### Conceptual Questions

**10.1** Explain why pooled OLS is biased in the presence of unobserved individual heterogeneity. What is the sign of the bias in the returns-to-union-membership example?

**10.2** What does FE "control for"? What does it NOT control for? Give an example of a confounder that FE cannot address.

**10.3** Why is FE equivalent to LSDV? Explain using the FWL theorem.

**10.4** Compare the FE and FD estimators. When are they equivalent? When do they differ?

**10.5** Explain the Hausman test. What is its null hypothesis? What should you do if the test rejects?

### Analytical Questions

**10.6** Show formally that the within estimator eliminates the individual fixed effect $\alpha_i$.

**10.7** In the two-period panel ($T = 2$), show that FD and FE give identical estimates.

**10.8** Consider the model $Y_{it} = \alpha_i + \beta X_{it} + u_{it}$. Suppose $X_{it} = \alpha_i + \epsilon_{it}$ (the regressor depends on the individual effect). Show that pooled OLS is biased and derive the direction of bias.

**10.9** Show that including individual dummy variables in a regression and applying OLS gives the same coefficient as the within estimator (LSDV equivalence).

### Applied Questions

**10.10** Using a wages panel dataset in R, estimate: (a) pooled OLS; (b) FE (within estimator); (c) first differences. Compare and interpret the results.

**10.11** Apply the Hausman test to your estimates. What do you conclude about the appropriate model?

---

## R Lab 10: Fixed Effects Estimation

### Setup

```r
library(tidyverse)
library(plm)     # panel data estimation
library(lmtest)
library(sandwich)

# Install and load data
# install.packages("plm")
data("Wages", package = "plm")
head(Wages)
# Variables: id, time, lwage (log wage), ed (education), exp (experience),
#            union (union status), black, etc.
```

### Exercise 10.1: Pooled OLS

```r
# Convert to panel data format
wages_panel <- pdata.frame(Wages, index = c("id", "time"))

# Pooled OLS
pool_model <- plm(lwage ~ ed + exp + I(exp^2) + union + black,
                   data = wages_panel, model = "pooling")
summary(pool_model)
```

### Exercise 10.2: Fixed Effects (Within Estimator)

```r
# Fixed Effects (Within) Model
fe_model <- plm(lwage ~ ed + exp + I(exp^2) + union + black,
                 data = wages_panel, model = "within")
summary(fe_model)
cat("FE coefficient on union:", round(coef(fe_model)["union"], 4), "\n")
cat("Pool OLS coefficient on union:", round(coef(pool_model)["union"], 4), "\n")
```

### Exercise 10.3: First Differences

```r
# First Differences
fd_model <- plm(lwage ~ ed + exp + I(exp^2) + union + black,
                 data = wages_panel, model = "fd")
summary(fd_model)
```

### Exercise 10.4: LSDV (verify FE equivalence)

```r
# LSDV using lm() -- add factor(id) as dummy variables
# WARNING: this is slow for large N!
# Use a small subset for illustration
wages_small <- Wages[Wages$id <= 50, ]

lsdv_model <- lm(lwage ~ ed + exp + I(exp^2) + union + factor(id),
                   data = wages_small)
fe_small <- plm(lwage ~ ed + exp + I(exp^2) + union,
                 data = pdata.frame(wages_small, index = c("id", "time")),
                 model = "within")

cat("LSDV union coefficient:", round(coef(lsdv_model)["union"], 6), "\n")
cat("FE union coefficient:  ", round(coef(fe_small)["union"], 6), "\n")
```

### Exercise 10.5: Random Effects and Hausman Test

```r
# Random Effects
re_model <- plm(lwage ~ ed + exp + I(exp^2) + union + black,
                 data = wages_panel, model = "random")
summary(re_model)

# Hausman Test
phtest(fe_model, re_model)
```

### Exercise 10.6: Two-Way Fixed Effects

```r
# Two-Way FE (individual + time effects)
twofe_model <- plm(lwage ~ ed + exp + I(exp^2) + union + black,
                    data = wages_panel, model = "within", effect = "twoways")
summary(twofe_model)
```

---

*End of Chapter 10*

---

**References**

Card, D. (1995). Using geographic variation in college proximity to estimate the return to schooling. University of Toronto Press.

Wooldridge, J. M. (2019). *Introductory Econometrics*. Chapter 14.

Angrist, J. D., and Pischke, J. (2009). *Mostly Harmless Econometrics*. Chapter 5.

Cunningham, S. (2021). *Causal Inference: The Mixtape*. Chapter on panel data.

Hausman, J. A. (1978). Specification tests in econometrics. *Econometrica*, 46(6), 1251–1271.
