# Chapter 8: Instrumental Variables and Two-Stage Least Squares

---

## Chapter Overview

Chapters 2–7 developed regression analysis as a tool for estimating conditional means and partial effects. But we repeatedly noted that OLS identifies causal effects only under strict exogeneity — an assumption that fails whenever there is omitted variable bias, reverse causality, or measurement error. This chapter introduces **Instrumental Variables (IV)** — arguably the most important identification strategy in applied economics — as a way to estimate causal effects when OLS is endogenous.

The key insight: if we can find a variable $Z_i$ (the "instrument") that is correlated with the endogenous regressor $X_i$ but affects the outcome $Y_i$ only through $X_i$, then we can use the exogenous variation in $Z_i$ to "purge" the endogeneity from $X_i$.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. Explain the **endogeneity problem** and why OLS fails.
2. Define the two conditions for a valid instrument: **relevance** and **exclusion**.
3. Derive the **IV estimator** (Wald estimator) in the bivariate case.
4. Derive and interpret the **Two-Stage Least Squares (2SLS)** estimator in the general case.
5. Derive the asymptotic distribution of 2SLS.
6. Explain the **weak instruments** problem and its consequences.
7. Use the **first-stage $F$-statistic** to test for weak instruments.
8. Apply IV methods to canonical empirical examples (Angrist and Krueger, 1991).

---

## 8.1 The Endogeneity Problem

**Definition 8.1 (Endogeneity):** The regressor $X_i$ is **endogenous** in the regression $Y_i = \alpha + \rho X_i + u_i$ if $\text{Cov}(X_i, u_i) \neq 0$.

When this holds, OLS is biased and inconsistent:

$$\text{plim}(\hat{\rho}^{OLS}) = \rho + \frac{\text{Cov}(X_i, u_i)}{V(X_i)} \neq \rho$$

The three main sources of endogeneity are:

1. **Omitted variables:** $u_i$ contains an omitted variable $A_i$ correlated with $X_i$ (e.g., ability in the wage regression).
2. **Reverse causality:** $Y_i$ causes $X_i$ as well as vice versa (e.g., income and health).
3. **Measurement error:** $X_i$ is measured with error correlated with the true $X_i^*$ (attenuation bias).

---

## 8.2 The Instrumental Variables (IV) Estimator

### 8.2.1 What Is an Instrument?

An **instrument** $Z_i$ must satisfy two conditions:

**Condition 1 — Relevance (First Stage):** $\text{Cov}(Z_i, X_i) \neq 0$.

The instrument must be correlated with the endogenous regressor.

**Condition 2 — Exclusion Restriction (Exogeneity):** $\text{Cov}(Z_i, u_i) = 0$.

The instrument must be uncorrelated with the structural error — it affects $Y_i$ only through $X_i$.

Graphically: $Z_i \to X_i \to Y_i$ (with $Z_i$ having no direct path to $Y_i$).

### 8.2.2 The Wald Estimator (Bivariate Case)

In the bivariate model $Y_i = \alpha + \rho X_i + u_i$ with a single binary instrument $Z_i \in \{0,1\}$:

$$\hat{\rho}^{IV} = \frac{E[Y_i \mid Z_i = 1] - E[Y_i \mid Z_i = 0]}{E[X_i \mid Z_i = 1] - E[X_i \mid Z_i = 0]} = \frac{\text{Reduced Form}}{\text{First Stage}}$$

This is the **Wald estimator**: the ratio of the effect of the instrument on the outcome to the effect of the instrument on the endogenous regressor.

**Why this works:** If $Z_i$ is randomly assigned (or as good as random), it affects $Y_i$ only through $X_i$. Dividing the total effect of $Z_i$ on $Y_i$ by the effect of $Z_i$ on $X_i$ "scales" the outcome effect to be per unit of $X_i$ — yielding the causal effect of $X_i$ on $Y_i$.

### 8.2.3 Consistency of the IV Estimator

**Proof:** Using sample moments:

$$\hat{\rho}^{IV} = \frac{\text{Cov}_s(Z_i, Y_i)}{\text{Cov}_s(Z_i, X_i)}$$

Substituting $Y_i = \alpha + \rho X_i + u_i$:

$$\frac{\text{Cov}(Z_i, Y_i)}{\text{Cov}(Z_i, X_i)} = \frac{\text{Cov}(Z_i, \alpha + \rho X_i + u_i)}{\text{Cov}(Z_i, X_i)} = \frac{\rho \text{Cov}(Z_i, X_i) + \text{Cov}(Z_i, u_i)}{\text{Cov}(Z_i, X_i)}$$

Under the exclusion restriction $\text{Cov}(Z_i, u_i) = 0$: $\hat{\rho}^{IV} \xrightarrow{p} \rho$. $\square$

---

## 8.3 Two-Stage Least Squares (2SLS): The General Case

With multiple endogenous variables and multiple instruments, we use **Two-Stage Least Squares (2SLS)**.

### 8.3.1 The General Setup

The **structural equation** is:

$$\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{u}$$

where $\mathbf{X} = [\mathbf{X}_1, \mathbf{X}_2]$: $\mathbf{X}_1$ contains the exogenous regressors (controls) and $\mathbf{X}_2$ contains the $k_2$ endogenous variables.

The **instrument set** is $\mathbf{Z} = [\mathbf{X}_1, \mathbf{Z}_2]$: the same exogenous controls $\mathbf{X}_1$ plus $\ell \geq k_2$ excluded instruments $\mathbf{Z}_2$.

For **identification**: $\ell \geq k_2$ (order condition — at least as many instruments as endogenous variables).

### 8.3.2 The Two Stages

**Stage 1 (First Stage):** Regress each endogenous variable on all instruments:

$$\mathbf{X}_2 = \mathbf{Z}\boldsymbol{\Pi} + \mathbf{V}$$

Obtain fitted values: $\hat{\mathbf{X}}_2 = \mathbf{Z}(\mathbf{Z}^T\mathbf{Z})^{-1}\mathbf{Z}^T\mathbf{X}_2 = \mathbf{P_Z}\mathbf{X}_2$

This decomposes $\mathbf{X}_2$ into a part predicted by the instruments ($\hat{\mathbf{X}}_2$, exogenous variation) and a residual ($\hat{\mathbf{V}}$, endogenous variation).

**Stage 2 (Second Stage):** Regress $\mathbf{y}$ on $\hat{\mathbf{X}} = [\mathbf{X}_1, \hat{\mathbf{X}}_2]$:

$$\hat{\boldsymbol{\beta}}^{2SLS} = (\hat{\mathbf{X}}^T\hat{\mathbf{X}})^{-1}\hat{\mathbf{X}}^T\mathbf{y}$$

### 8.3.3 The 2SLS Estimator in Matrix Form

The 2SLS estimator can be written more compactly:

$$\hat{\boldsymbol{\beta}}^{2SLS} = (\mathbf{X}^T\mathbf{P_Z}\mathbf{X})^{-1}\mathbf{X}^T\mathbf{P_Z}\mathbf{y}$$

**Key insight:** 2SLS projects both $\mathbf{X}$ and $\mathbf{y}$ onto the column space of $\mathbf{Z}$ before running the regression. This replaces the endogenous variation in $\mathbf{X}$ with the exogenous variation from the instruments.

**Special case:** When $\mathbf{Z} = \mathbf{X}$ (all regressors are exogenous), $\mathbf{P_Z} = \mathbf{P_X}$ and 2SLS = OLS.

---

## 8.4 Asymptotic Properties of 2SLS

**Theorem 8.1 (Consistency of 2SLS):** Under the conditions:
1. Linear model $\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{u}$
2. Instrument relevance: $E[\mathbf{z}_i \mathbf{x}_i^T]$ has rank $k$
3. Exclusion restriction: $E[\mathbf{z}_i u_i] = \mathbf{0}$

Then $\hat{\boldsymbol{\beta}}^{2SLS} \xrightarrow{p} \boldsymbol{\beta}$.

**Theorem 8.2 (Asymptotic Distribution of 2SLS):**

$$\sqrt{n}(\hat{\boldsymbol{\beta}}^{2SLS} - \boldsymbol{\beta}) \xrightarrow{d} N\!\left(\mathbf{0}, \mathbf{V}^{2SLS}\right)$$

where under homoskedasticity:

$$\mathbf{V}^{2SLS} = \sigma^2 \left(E[\mathbf{x}_i \mathbf{z}_i^T]\left(E[\mathbf{z}_i\mathbf{z}_i^T]\right)^{-1}E[\mathbf{z}_i\mathbf{x}_i^T]\right)^{-1}$$

In practice, use the 2SLS residuals $\hat{\mathbf{u}}^{2SLS} = \mathbf{y} - \mathbf{X}\hat{\boldsymbol{\beta}}^{2SLS}$ (note: NOT the residuals from Stage 2) to estimate $\sigma^2$ and use robust/cluster SEs.

**Important warning:** Never use software's default Stage-2 SEs — they use Stage-2 residuals and are wrong. Always use the correct 2SLS standard errors (or use dedicated IV commands: `ivreg()` in R, `ivregress` in Stata).

---

## 8.5 Instrument Validity: Relevance and Exclusion

### 8.5.1 Testing Relevance: The First-Stage $F$-Statistic

The relevance assumption can be **tested**: run the first stage and report the $F$-statistic for the joint significance of the excluded instruments.

**Rule of thumb (Staiger and Stock, 1997):** First-stage $F > 10$ is often cited as a threshold for "strong" instruments.

**The weak instruments problem (preview):** When instruments are only weakly correlated with the endogenous variable ($F$ close to 0), 2SLS has poor finite-sample properties:
- The 2SLS estimator is biased toward OLS.
- Standard errors are misleading; $t$-tests are severely size-distorted.

### 8.5.2 The Exclusion Restriction Cannot Be Tested

The exclusion restriction $E[\mathbf{z}_i u_i] = \mathbf{0}$ is **fundamentally untestable** (in the sense that $u_i$ is unobserved). Researchers must argue for it on substantive grounds.

**Testing over-identifying restrictions (when $\ell > k_2$):** When we have more instruments than needed, we can test whether different instruments give similar estimates — the **Sargan-Hansen test**. Rejection suggests at least one instrument is invalid.

**However:** The Sargan-Hansen test only checks consistency across instruments, not absolute validity. If all instruments are invalid in the same way, it will not detect the problem.

---

## 8.6 Weak Instruments: Diagnosis and Remedies

### 8.6.1 The Weak Instruments Problem

**Definition 8.2 (Weak Instruments):** Instruments are weak if the first-stage relationship is weak — the instruments explain little variation in the endogenous variable beyond controls.

With weak instruments, even modest violations of the exclusion restriction cause large bias. The bias of 2SLS relative to OLS is approximately:

$$\text{Bias}(2SLS) \approx \frac{1}{F}\text{Bias}(OLS)$$

where $F$ is the first-stage $F$-statistic. With $F = 5$, 2SLS is biased about 20% of the way toward OLS.

### 8.6.2 Detection

- **First-stage $F$-statistic:** Always report and examine. $F < 10$ is cause for concern.
- **Partial $R^2$ of instruments:** The fraction of variation in the endogenous variable explained by the excluded instruments alone.
- **Anderson-Rubin confidence sets:** Inference that is robust to weak instruments.

### 8.6.3 Remedies

- Find stronger instruments.
- Use **Limited Information Maximum Likelihood (LIML)**, which is median-unbiased under many-instrument asymptotics.
- Use **Anderson-Rubin tests** for inference robust to weak instruments.

---

## 8.7 Empirical Illustration: Angrist and Krueger (1991)

### 8.7.1 The Research Question

Angrist and Krueger (1991) study the return to education using compulsory schooling laws as an instrument. Their key insight: US students born early in the year (Q1) start school at an older age and can legally drop out having completed less education than students born later in the year (Q4). Therefore, **quarter of birth** creates quasi-random variation in education levels.

**Instrument:** Quarter of birth (Q1 vs. Q4).

**Endogenous variable:** Years of schooling.

**Outcome:** Log weekly earnings.

### 8.7.2 Instrument Validity

**Relevance:** Q1 births have on average 0.1–0.2 fewer years of schooling than Q4 births. This is the "season of birth" effect documented in the data. The first-stage relationship, while small, is statistically significant.

**Exclusion restriction:** Quarter of birth should affect earnings *only* through its effect on schooling. (This is plausible if Q1 vs. Q4 birth is essentially random and birth quarter has no direct effect on labor market outcomes.)

### 8.7.3 Results

**OLS estimate:** Return to schooling ≈ 7–8% per year.

**IV/2SLS estimate (using Q1 birth as instrument):** Return to schooling ≈ 8–10% per year.

The OLS and IV estimates are remarkably similar. This suggests (though doesn't prove) that ability bias in OLS may be smaller than often assumed, or that the instrument is strong enough to identify a similar population parameter.

> **Box 8.1 — The Angrist-Krueger (1991) Paper**
>
> Angrist and Krueger use quarter of birth interacted with year of birth and state of birth as instruments — generating many instruments. Card (1995) later pointed out that many weak instruments can lead to biased 2SLS estimates toward OLS. This prompted important work on weak instruments and LIML. The original paper remains a canonical example of creative instrument design.

### 8.7.4 Reduced Form and First Stage

A useful way to present IV results is to show:

1. **First Stage:** Quarter of birth → Education (must be significant).
2. **Reduced Form:** Quarter of birth → Log wages (directly).
3. **2SLS:** The ratio, rescaling reduced form to "per year of education."

If the reduced form is insignificant, the instrument has no explanatory power — the IV estimate has no credibility.

---

## Chapter Summary

- **Endogeneity** ($\text{Cov}(X_i, u_i) \neq 0$) makes OLS biased and inconsistent.
- An instrument $Z_i$ must satisfy **relevance** ($\text{Cov}(Z, X) \neq 0$) and **exclusion** ($\text{Cov}(Z, u) = 0$).
- The **Wald estimator** is the ratio of the reduced form to the first stage.
- **2SLS** generalizes IV to multiple endogenous variables and instruments by projecting regressors onto the instrument space.
- **Weak instruments** cause large bias toward OLS; always report the first-stage $F$-statistic.
- The exclusion restriction is untestable; defend it on substantive grounds.
- Angrist and Krueger (1991) is a canonical application using quarter of birth as an instrument for education.

---

## Key Terms

**Endogeneity** — $\text{Cov}(X_i, u_i) \neq 0$; OLS is biased and inconsistent.

**Instrument** — variable $Z_i$ correlated with $X_i$ but uncorrelated with $u_i$.

**Relevance** — $\text{Cov}(Z_i, X_i) \neq 0$.

**Exclusion restriction** — $\text{Cov}(Z_i, u_i) = 0$.

**Wald estimator** — $\hat{\rho}^{IV} = \frac{\text{Cov}(Z,Y)}{\text{Cov}(Z,X)}$.

**Two-Stage Least Squares (2SLS)** — IV estimator for the general case with multiple instruments and endogenous variables.

**First stage** — regression of endogenous variable(s) on all instruments.

**Reduced form** — regression of outcome on instruments directly.

**Weak instruments** — instruments with small first-stage $F$-statistic; cause bias and size distortion.

**Sargan-Hansen test** — test of over-identifying restrictions; checks consistency across instruments.

---

## Exercises

### Conceptual Questions

**8.1** Explain why OLS is biased when $\text{Cov}(X_i, u_i) \neq 0$. Give three economic examples of endogeneity.

**8.2** State the two conditions for a valid instrument. Can we test both in practice? Explain.

**8.3** Describe the two stages of 2SLS in plain language. What is "purged" in the first stage?

**8.4** Why is the first-stage $F$-statistic important? What is the consequence of ignoring weak instruments?

**8.5** "The exclusion restriction is satisfied if the instrument is randomly assigned." Evaluate this claim.

### Analytical Questions

**8.6** In the bivariate model $Y_i = \alpha + \rho X_i + u_i$, with a single instrument $Z_i$:
(a) Derive the Wald estimator.
(b) Show it is consistent when $\text{Cov}(Z_i, u_i) = 0$ and $\text{Cov}(Z_i, X_i) \neq 0$.
(c) What is the probability limit when $\text{Cov}(Z_i, u_i) \neq 0$?

**8.7** Show that the 2SLS estimator equals $\hat{\boldsymbol{\beta}}^{2SLS} = (\mathbf{X}^T\mathbf{P_Z}\mathbf{X})^{-1}\mathbf{X}^T\mathbf{P_Z}\mathbf{y}$.

**8.8** In the Angrist-Krueger example with $Z_i$ = 1(Q1 birth) and $X_i$ = years of schooling:
- $E[Y_i \mid Z_i = 1] = 5.80$, $E[Y_i \mid Z_i = 0] = 5.90$
- $E[X_i \mid Z_i = 1] = 12.68$, $E[X_i \mid Z_i = 0] = 12.79$

Compute the Wald estimate of the return to schooling.

### Applied Questions

**8.9** Using the `card.dta` data (Card, 1995): college proximity as an instrument for education. In R:
(a) Run OLS of log wages on education and controls.
(b) Report the first-stage $F$-statistic.
(c) Run 2SLS using college proximity as the instrument.
(d) Compare OLS and 2SLS estimates. Does the direction of change make sense?

---

## R Lab 8: IV and 2SLS

### Setup

```r
library(tidyverse)
library(AER)    # ivreg() for 2SLS
library(lmtest)
library(sandwich)

# Card (1995) data: effect of education on wages using college proximity as IV
# Available in the ivreg package or can be read from the PS3 data
# install.packages("ivreg")
library(ivreg)
data("SchoolingReturns", package = "ivreg")
df <- SchoolingReturns
```

### Exercise 8.1: OLS Baseline

```r
# OLS regression: log wage on education and controls
ols_model <- lm(wage ~ education + experience + I(experience^2) + ethnicity + 
                  smsa + south, data = df)
summary(ols_model)
cat("OLS coefficient on education:", round(coef(ols_model)["education"], 4), "\n")
```

### Exercise 8.2: First Stage

```r
# First stage: education on nearcollege (proximity to 4-year college) + controls
first_stage <- lm(education ~ nearcollege + experience + I(experience^2) + 
                    ethnicity + smsa + south, data = df)
summary(first_stage)
cat("First-stage coefficient on nearcollege:", round(coef(first_stage)["nearcollege"], 4), "\n")
cat("First-stage F-statistic:", round(summary(first_stage)$fstatistic[1], 2), "\n")

# Partial F-test for just the instrument
ols_no_iv <- lm(education ~ experience + I(experience^2) + ethnicity + smsa + south, data = df)
F_partial <- anova(ols_no_iv, first_stage)[["F"]][2]
cat("Partial F-statistic for instrument:", round(F_partial, 2), "\n")
```

### Exercise 8.3: Reduced Form

```r
# Reduced form: log wage on nearcollege directly
reduced_form <- lm(wage ~ nearcollege + experience + I(experience^2) + 
                     ethnicity + smsa + south, data = df)
summary(reduced_form)
cat("Reduced form coefficient:", round(coef(reduced_form)["nearcollege"], 4), "\n")
```

### Exercise 8.4: 2SLS Estimation

```r
# 2SLS using ivreg()
iv_model <- ivreg(wage ~ education + experience + I(experience^2) + ethnicity + smsa + south |
                  nearcollege + experience + I(experience^2) + ethnicity + smsa + south,
                  data = df)
summary(iv_model, diagnostics = TRUE)

cat("2SLS coefficient on education:", round(coef(iv_model)["education"], 4), "\n")

# Wald estimator (bivariate comparison)
wald_est <- coef(reduced_form)["nearcollege"] / coef(first_stage)["nearcollege"]
cat("Wald estimate:", round(wald_est, 4), "\n")
cat("2SLS estimate:", round(coef(iv_model)["education"], 4), "\n")
```

### Exercise 8.5: Visualizing First Stage

```r
ggplot(df, aes(x = factor(nearcollege), y = education)) +
  geom_boxplot(fill = "steelblue", alpha = 0.7) +
  labs(
    title = "First Stage: College Proximity and Years of Education",
    subtitle = "Living near a college is associated with more schooling",
    x = "Near College (0 = No, 1 = Yes)",
    y = "Years of Education"
  ) +
  theme_minimal()
```

---

*End of Chapter 8*

---

**References**

Angrist, J. D., and Krueger, A. B. (1991). Does compulsory school attendance affect schooling and earnings? *Quarterly Journal of Economics*, 106(4), 979–1014.

Card, D. (1995). Using geographic variation in college proximity to estimate the return to schooling. In L. Christofides et al. (eds.), *Aspects of Labour Market Behaviour*. University of Toronto Press.

Staiger, D., and Stock, J. H. (1997). Instrumental variables regression with weak instruments. *Econometrica*, 65(3), 557–586.

Davidson, R., and MacKinnon, J. G. (2004). *Econometric Theory and Methods*. Chapter 8.

Angrist, J. D., and Pischke, J. (2009). *Mostly Harmless Econometrics*. Chapter 4.
