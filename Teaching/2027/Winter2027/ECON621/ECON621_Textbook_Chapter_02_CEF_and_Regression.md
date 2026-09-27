# Chapter 2: The Conditional Expectation Function and Linear Regression

---

## Chapter Overview

Before we can understand why regression works — and when it doesn't — we need a clear statistical framework for describing relationships between variables. This chapter develops the **Conditional Expectation Function (CEF)**, the population object that regression is trying to estimate. We show that the CEF has deep and useful mathematical properties, that OLS regression is the best linear approximation to the CEF, and that the two coincide when the CEF happens to be linear.

This chapter also connects the regression framework to the causal questions introduced in Chapter 1. Understanding the relationship between regression and the CEF is essential for interpreting regression output correctly and avoiding common mistakes.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. Define the **Conditional Expectation Function (CEF)** and explain what it represents.
2. State and apply the **Law of Iterated Expectations (LIE)**.
3. Explain the **CEF Decomposition Property** and its implications.
4. Prove that the CEF is the **best predictor** of $Y$ given $X$ in the mean-squared-error sense.
5. Explain the **ANOVA Theorem** (variance decomposition).
6. State the **OLS linear regression problem** and derive the population parameter $\boldsymbol{\beta}^{OLS}$.
7. Explain why OLS is the **best linear approximation** to the CEF even when the CEF is non-linear.
8. Interpret regression coefficients as statements about the CEF.
9. Apply these concepts to real economic data using R.

---

## 2.1 Describing Relationships: From Scatter Plots to Functions

Consider the question: how do wages vary with education? Figure 2.1 (described below) shows a scatter plot of log weekly earnings against years of schooling, constructed from Current Population Survey (CPS) data. There is a clear positive relationship, but with enormous variation: two people with identical schooling can have very different earnings. What summary of this cloud of points do we want?

The obvious answer is: we want to know the **average wage for each level of education**. If we could calculate the mean of $Y_i$ (log earnings) for every value of $X_i$ (schooling), we would trace out a curve through the scatter plot. This curve is the **Conditional Expectation Function**.

> **Figure 2.1 Description:** Scatter plot of log weekly earnings ($Y$) against years of schooling ($X$) for a random sample of workers. The cloud of points slopes upward on average. Within each level of schooling, wages are spread over a wide range. The line running through the scatter plot represents $E[Y_i \mid X_i = x]$ for each value of $x$.

---

## 2.2 The Conditional Expectation Function (CEF)

**Definition 2.1 (CEF):** Let $Y_i$ be a random variable (the outcome) and $\mathbf{X}_i$ be a vector of conditioning variables (regressors). The **Conditional Expectation Function** is:

$$E[Y_i \mid \mathbf{X}_i = \mathbf{x}]$$

This is a function of $\mathbf{x}$ that gives the mean of $Y_i$ in the subpopulation where $\mathbf{X}_i$ equals $\mathbf{x}$.

### 2.2.1 The CEF with a Single Binary Variable

The simplest case has $X_i \in \{0, 1\}$:

$$E[Y_i \mid X_i = 1] = \text{mean outcome among treated units}$$
$$E[Y_i \mid X_i = 0] = \text{mean outcome among untreated units}$$

These are the two conditional means we discussed in Chapter 1. The CEF here takes only two values.

### 2.2.2 The CEF with a Continuous Variable

When $X_i$ is continuous, $E[Y_i \mid X_i = x]$ traces a potentially complex curve. For the education-wage example, it might look roughly linear but could be non-linear (e.g., the return to the 12th year of schooling may differ from the return to the 16th).

### 2.2.3 The Multivariate CEF

In practice, we condition on multiple variables $\mathbf{X}_i = (X_{1i}, X_{2i}, \ldots, X_{ki})^T$:

$$E[Y_i \mid \mathbf{X}_i = \mathbf{x}] = E\left[Y_i \mid X_{1i} = x_1, X_{2i} = x_2, \ldots, X_{ki} = x_k\right]$$

This is a function from $\mathbb{R}^k$ to $\mathbb{R}$. It answers the question: among all individuals with *exactly* these values of all $k$ covariates, what is the average value of $Y$?

---

## 2.3 The Law of Iterated Expectations

The Law of Iterated Expectations (LIE) is one of the most useful identities in probability and statistics. We will use it repeatedly throughout this course.

**Theorem 2.1 (Law of Iterated Expectations):**

$$E[Y_i] = E\left[E[Y_i \mid \mathbf{X}_i]\right]$$

*Interpretation:* You can compute the unconditional expectation of $Y_i$ in two steps: first compute $E[Y_i \mid \mathbf{X}_i = \mathbf{x}]$ for each value $\mathbf{x}$, then average this over the distribution of $\mathbf{X}_i$.

**Proof (continuous case):** Let $g(\mathbf{x}) = E[Y_i \mid \mathbf{X}_i = \mathbf{x}]$ and let $f_X(\mathbf{x})$ be the marginal density of $\mathbf{X}_i$. Then:

$$E\left[E[Y_i \mid \mathbf{X}_i]\right] = \int g(\mathbf{x}) f_X(\mathbf{x})\, d\mathbf{x} = \int E[Y_i \mid \mathbf{X}_i = \mathbf{x}] f_X(\mathbf{x})\, d\mathbf{x} = E[Y_i] \quad \square$$

### 2.3.1 Practical Application of the LIE

**Example 2.1:** Suppose we want to compute average wages in an economy where workers are either male (M) or female (F). The LIE tells us:

$$E[\text{Wage}] = E[\text{Wage} \mid \text{Male}] \cdot P(\text{Male}) + E[\text{Wage} \mid \text{Female}] \cdot P(\text{Female})$$

This is intuitive: the average wage is a probability-weighted average of average wages within each group.

**Corollary 2.1:** $E[h(\mathbf{X}_i) \epsilon_i] = 0$ for any function $h$, where $\epsilon_i = Y_i - E[Y_i \mid \mathbf{X}_i]$.

*Proof:* By the LIE, $E[h(\mathbf{X}_i) \epsilon_i] = E\left[E[h(\mathbf{X}_i) \epsilon_i \mid \mathbf{X}_i]\right] = E\left[h(\mathbf{X}_i) E[\epsilon_i \mid \mathbf{X}_i]\right] = 0$, since $E[\epsilon_i \mid \mathbf{X}_i] = 0$ by construction. $\square$

---

## 2.4 The CEF Decomposition and Its Properties

The CEF defines a natural **decomposition** of any random variable into a systematic part and a residual part.

### 2.4.1 The CEF Decomposition

**Proposition 2.1 (CEF Decomposition):** Any random variable $Y_i$ can be written as:

$$Y_i = \underbrace{E[Y_i \mid \mathbf{X}_i]}_{\text{Systematic part}} + \underbrace{\epsilon_i}_{\text{Residual part}}$$

where the residual $\epsilon_i = Y_i - E[Y_i \mid \mathbf{X}_i]$ satisfies:

1. **Mean Independence:** $E[\epsilon_i \mid \mathbf{X}_i] = 0$ for all values of $\mathbf{X}_i$.
2. **Zero Unconditional Mean:** $E[\epsilon_i] = 0$ (by the LIE).
3. **Uncorrelated with Any Function of $\mathbf{X}_i$:** $E[h(\mathbf{X}_i) \epsilon_i] = 0$ for any function $h$.

*Proof:* Property (1) follows directly from the definition: $E[\epsilon_i \mid \mathbf{X}_i] = E[Y_i \mid \mathbf{X}_i] - E[Y_i \mid \mathbf{X}_i] = 0$. Properties (2) and (3) follow from (1) and the LIE. $\square$

> **This decomposition is fundamental.** It says that any variable can be split into a part predictable from $\mathbf{X}_i$ (the CEF) and a part that is, in the strongest possible sense, unpredictable given $\mathbf{X}_i$ (the residual $\epsilon_i$).

### 2.4.2 The CEF is the Best Predictor

**Theorem 2.2 (CEF as Best Predictor):** Among *all* functions $m(\mathbf{X}_i)$, the CEF $E[Y_i \mid \mathbf{X}_i]$ minimizes the **Mean Squared Prediction Error (MSPE)**:

$$E[Y_i \mid \mathbf{X}_i] = \underset{m(\cdot)}{\operatorname{argmin}} \ E\!\left[(Y_i - m(\mathbf{X}_i))^2\right]$$

*Proof:* For any function $m$, write:

$$E\left[(Y_i - m(\mathbf{X}_i))^2\right] = E\left[(Y_i - E[Y_i \mid \mathbf{X}_i] + E[Y_i \mid \mathbf{X}_i] - m(\mathbf{X}_i))^2\right]$$

$$= E[\epsilon_i^2] + E\left[(E[Y_i \mid \mathbf{X}_i] - m(\mathbf{X}_i))^2\right] + 2E\!\left[\epsilon_i (E[Y_i \mid \mathbf{X}_i] - m(\mathbf{X}_i))\right]$$

The cross term is zero by Corollary 2.1. The second term is non-negative and equals zero only when $m(\mathbf{X}_i) = E[Y_i \mid \mathbf{X}_i]$. $\square$

*Intuition:* $E[Y_i]$ is the best constant predictor of $Y_i$. The CEF does better by conditioning on available information: by the LIE, $E[E[Y_i \mid \mathbf{X}_i]] = E[Y_i]$, so the CEF is as good on average and better in specific strata.

### 2.4.3 The ANOVA Theorem

**Theorem 2.3 (Variance Decomposition / ANOVA):**

$$\underbrace{V(Y_i)}_{\text{Total variance}} = \underbrace{V(E[Y_i \mid \mathbf{X}_i])}_{\text{Explained variance}} + \underbrace{E[V(Y_i \mid \mathbf{X}_i)]}_{\text{Unexplained variance}}$$

*Interpretation:* The total variation in $Y_i$ decomposes into:
- The variation in the conditional mean (what $\mathbf{X}$ can "explain")
- The average within-group variation (what remains after conditioning on $\mathbf{X}$)

This is the population analogue of the sample $R^2$ decomposition $\text{TSS} = \text{ESS} + \text{SSR}$.

**Example 2.2 (ANOVA in Wage Data):** In the CPS data, approximately 25–30% of the variation in log wages is explained by education, age, gender, and occupation. The remaining 70–75% is within-group variation: workers with the same observable characteristics still have very different wages.

---

## 2.5 Why Linear Regression?

The CEF can take any shape — it need not be linear. So why do economists almost always estimate *linear* regressions? This section provides two justifications.

### 2.5.1 Justification 1: The CEF is Linear

If the true population CEF is linear:

$$E[Y_i \mid \mathbf{X}_i] = \mathbf{X}_i^T \boldsymbol{\beta}^*$$

then by the CEF decomposition theorem:

$$E\left[\mathbf{X}_i(Y_i - \mathbf{X}_i^T \boldsymbol{\beta}^*)\right] = \mathbf{0}$$

Solving for $\boldsymbol{\beta}^*$:

$$\boldsymbol{\beta}^* = E[\mathbf{X}_i \mathbf{X}_i^T]^{-1} E[\mathbf{X}_i Y_i] \equiv \boldsymbol{\beta}^{OLS}$$

So when the CEF is linear, the OLS population parameter $\boldsymbol{\beta}^{OLS}$ equals the true parameter $\boldsymbol{\beta}^*$ of the CEF. The linear regression model is correctly specified.

**When is the CEF exactly linear?** The CEF is linear in $X$ when $(Y, X)$ follow a jointly normal distribution (because $E[Y \mid X] = \mu_Y + \rho \frac{\sigma_Y}{\sigma_X}(X - \mu_X)$ for the bivariate normal). But this is a very strong assumption.

### 2.5.2 Justification 2: OLS Provides the Best Linear Approximation

What if the CEF is *not* linear? Does OLS still make sense? The answer is yes.

**Theorem 2.4 (OLS as Best Linear Approximation):** Even when $E[Y_i \mid \mathbf{X}_i]$ is not linear, $\boldsymbol{\beta}^{OLS}$ minimizes the mean squared error of linear prediction:

$$\boldsymbol{\beta}^{OLS} = \underset{\mathbf{b}}{\operatorname{argmin}} \ E\!\left[(Y_i - \mathbf{X}_i^T \mathbf{b})^2\right]$$

Moreover, the linear projection $\mathbf{X}_i^T \boldsymbol{\beta}^{OLS}$ is the **best linear approximation to the CEF**:

$$\boldsymbol{\beta}^{OLS} = \underset{\mathbf{b}}{\operatorname{argmin}} \ E\!\left[(E[Y_i \mid \mathbf{X}_i] - \mathbf{X}_i^T \mathbf{b})^2\right]$$

*Proof of the second result:* Taking the first-order condition:

$$E\!\left[\mathbf{X}_i(E[Y_i \mid \mathbf{X}_i] - \mathbf{X}_i^T \boldsymbol{\beta})\right] = \mathbf{0}$$

$$\Rightarrow \boldsymbol{\beta} = E[\mathbf{X}_i \mathbf{X}_i^T]^{-1} E[\mathbf{X}_i E[Y_i \mid \mathbf{X}_i]]$$

By the CEF decomposition, $E[\mathbf{X}_i E[Y_i \mid \mathbf{X}_i]] = E[\mathbf{X}_i Y_i] - E[\mathbf{X}_i \epsilon_i] = E[\mathbf{X}_i Y_i]$. 

Therefore: $\boldsymbol{\beta} = E[\mathbf{X}_i \mathbf{X}_i^T]^{-1} E[\mathbf{X}_i Y_i] = \boldsymbol{\beta}^{OLS}$. $\square$

> **Key Takeaway:** OLS provides the best linear fit to the data, regardless of whether the CEF is linear or not. When the CEF is not linear, the OLS regression is the best *linear* approximation to the CEF — it fits a straight line through a potentially curved cloud as well as any straight line can.

### 2.5.3 Visualizing the Linear Approximation

Consider the education-wage CEF. The true CEF may curve (with higher returns to college years than to early secondary years). But the OLS regression line through the scatter plot is the straight line that minimizes the sum of squared vertical distances to all data points. This line is the best linear summary of the relationship.

For many purposes — especially for computing conditional means at typical values of the covariates — the linear approximation is excellent. For prediction at extreme values or for studying non-linearities, we might prefer more flexible methods.

---

## 2.6 OLS as the Best Linear Approximation to the CEF

Let us be more explicit about the **population linear projection model**. 

**Definition 2.2 (Linear Projection / Population OLS):** The linear projection of $Y_i$ on $\mathbf{X}_i$ is:

$$L(Y_i \mid \mathbf{X}_i) = \mathbf{X}_i^T \boldsymbol{\beta}^{OLS}$$

where $\boldsymbol{\beta}^{OLS}$ solves:

$$\boldsymbol{\beta}^{OLS} = \left(E[\mathbf{X}_i \mathbf{X}_i^T]\right)^{-1} E[\mathbf{X}_i Y_i]$$

This is the population parameter vector that OLS estimates from a sample. The sample OLS estimator (Chapter 3) converges to this population quantity as sample size grows.

**Interpreting the Components:** Consider the simple bivariate case with $\mathbf{X}_i = (1, X_i)^T$ and $\boldsymbol{\beta} = (\alpha, \beta)^T$. Then:

$$\beta^{OLS} = \frac{\text{Cov}(X_i, Y_i)}{V(X_i)}$$

This is the **population regression slope**: the ratio of the covariance of $X$ and $Y$ to the variance of $X$. It equals the change in the conditional mean of $Y$ for a one-unit change in $X$, under the linear approximation.

### 2.6.1 The Linear Regression Equation

Given $\boldsymbol{\beta}^{OLS}$, we can always write:

$$Y_i = \mathbf{X}_i^T \boldsymbol{\beta}^{OLS} + \underbrace{e_i}_{\text{Population OLS residual}}$$

where $e_i = Y_i - \mathbf{X}_i^T \boldsymbol{\beta}^{OLS}$ is the **population OLS residual** (not the CEF residual $\epsilon_i$, though they coincide when the CEF is linear). By construction:

$$E[\mathbf{X}_i e_i] = \mathbf{0}$$

This **zero covariance condition** (or **orthogonality condition**) is the key property of the OLS estimator — it is weaker than strict mean independence $E[e_i \mid \mathbf{X}_i] = 0$.

### 2.6.2 When Does Regression Identify Causal Effects?

Regression identifies the CEF (up to a linear approximation). But the CEF is not necessarily a causal relationship. Whether the regression coefficient $\beta$ has a causal interpretation depends on *why* $E[Y_i \mid X_i = x]$ varies with $x$.

Three distinct reasons for $E[Y_i \mid X_i = x]$ to vary with $x$:

1. **Causality:** changing $X$ for a given individual changes their $Y$.
2. **Selection:** people with higher $X$ would have had higher $Y$ even without the higher $X$ (like the wage-education example with ability selection).
3. **Reverse causality:** $Y$ causes $X$ (e.g., healthier people exercise more).

OLS recovers the CEF regardless of the reason. The **CEF is causal** only if $X$ is randomly assigned or if we can credibly argue that, conditional on $\mathbf{X}$, the treatment variable of interest is "as good as randomly assigned." This is the identification problem we discussed in Chapter 1.

---

## 2.7 Empirical Illustration: Education and Wages

Let us apply these concepts to a classic economic question: how does schooling affect wages?

### 2.7.1 Data and Setting

We use data from the Current Population Survey (CPS), a representative survey of the US labour market. The outcome variable $Y_i$ is the log of weekly earnings; the regressor $X_i$ is years of completed schooling.

### 2.7.2 The Wage-Schooling CEF

When we calculate $E[\log(\text{wage}) \mid \text{schooling} = s]$ for each value of $s = 0, 1, \ldots, 20$, we trace out the wage-schooling CEF. Key features:

- The CEF is approximately **linear** over most of the schooling range.
- There is a notable **kink** at 12 years (high school completion) and at 16 years (college completion) — the "sheepskin" effects.
- The overall slope is approximately **0.08–0.11** in OLS regressions, implying each additional year of schooling is associated with an 8–11% increase in wages.

### 2.7.3 The Linear Regression Approximation

The OLS regression line:

$$\widehat{\log(\text{wage})_i} = \hat{\alpha} + \hat{\beta} \times \text{schooling}_i$$

provides the best linear fit to the wage-schooling scatter. The slope $\hat{\beta} \approx 0.10$ says: on average, each additional year of schooling is associated with a 10% increase in weekly wages.

**Is this causal?** Not necessarily. People who stay in school longer differ in many ways — cognitive ability, family background, patience — from those who leave school earlier. The OLS regression does not distinguish between the causal effect of schooling and these selection differences. We return to this in Chapters 6 (omitted variable bias) and 8 (instrumental variables).

---

## Chapter Summary

- The **Conditional Expectation Function (CEF)** $E[Y_i \mid \mathbf{X}_i]$ is the best predictor of $Y_i$ given $\mathbf{X}_i$ in the mean-squared-error sense.
- The **CEF Decomposition** writes $Y_i = E[Y_i \mid \mathbf{X}_i] + \epsilon_i$, where $\epsilon_i$ has zero mean conditional on $\mathbf{X}_i$.
- The **Law of Iterated Expectations** relates the unconditional mean to an average of conditional means.
- The **ANOVA Theorem** decomposes total variance into explained and unexplained components.
- The OLS population coefficient vector $\boldsymbol{\beta}^{OLS}$ equals the CEF parameter when the CEF is linear.
- When the CEF is non-linear, OLS still provides the **best linear approximation** to the CEF.
- Whether the OLS regression has a **causal interpretation** depends on the research design, not the statistical method.

---

## Key Terms

**Conditional Expectation Function (CEF)** — the function $E[Y_i \mid \mathbf{X}_i = \mathbf{x}]$ giving the expected value of $Y$ for each value of $\mathbf{X}$.

**Law of Iterated Expectations (LIE)** — $E[Y_i] = E[E[Y_i \mid \mathbf{X}_i]]$.

**CEF Decomposition** — $Y_i = E[Y_i \mid \mathbf{X}_i] + \epsilon_i$ where $E[\epsilon_i \mid \mathbf{X}_i] = 0$.

**Mean Independence** — the condition $E[\epsilon_i \mid \mathbf{X}_i] = 0$.

**ANOVA Theorem** — $V(Y_i) = V(E[Y_i \mid \mathbf{X}_i]) + E[V(Y_i \mid \mathbf{X}_i)]$.

**Best linear approximation** — the linear function of $\mathbf{X}_i$ that is closest to the CEF in the mean-squared-error sense.

**Population OLS parameter** — $\boldsymbol{\beta}^{OLS} = (E[\mathbf{X}_i \mathbf{X}_i^T])^{-1} E[\mathbf{X}_i Y_i]$.

**Linear projection** — $L(Y_i \mid \mathbf{X}_i) = \mathbf{X}_i^T \boldsymbol{\beta}^{OLS}$.

**Orthogonality condition** — $E[\mathbf{X}_i e_i] = \mathbf{0}$, where $e_i$ is the population OLS residual.

---

## Exercises

### Conceptual Questions

**2.1** Explain in plain language what the CEF $E[Y_i \mid X_i = x]$ means. Give an example from economics where the CEF is likely non-linear.

**2.2** State the Law of Iterated Expectations. Give an example where you would use it.

**2.3** Is it possible for $E[Y_i \mid X_i = x]$ to be decreasing in $x$ even though the population regression coefficient $\beta^{OLS}$ is positive? Give an example or prove impossibility.

**2.4** Explain the difference between the CEF residual $\epsilon_i = Y_i - E[Y_i \mid \mathbf{X}_i]$ and the population OLS residual $e_i = Y_i - \mathbf{X}_i^T \boldsymbol{\beta}^{OLS}$. When are they the same?

**2.5** "OLS regression always identifies the causal effect of $X$ on $Y$." Is this statement true or false? Explain.

### Analytical Questions

**2.6** Let $Y_i \in \{0, 1\}$ (binary outcome) and $X_i \in \{0, 1\}$ (binary treatment), with joint distribution:

| | $X_i = 0$ | $X_i = 1$ |
|---|---|---|
| $Y_i = 0$ | 0.40 | 0.10 |
| $Y_i = 1$ | 0.20 | 0.30 |

(a) Compute $E[Y_i]$, $E[Y_i \mid X_i = 0]$, and $E[Y_i \mid X_i = 1]$.  
(b) Compute $\beta^{OLS}$ from the bivariate regression of $Y_i$ on $X_i$ using $\beta^{OLS} = \text{Cov}(X,Y)/V(X)$.  
(c) Interpret the slope coefficient. Does it have a causal interpretation here?

**2.7** Using the ANOVA theorem, show that the population $R^2 = V(E[Y_i \mid \mathbf{X}_i]) / V(Y_i)$ lies between 0 and 1.

**2.8** Suppose $E[Y_i \mid X_i] = \alpha + \beta X_i + \gamma X_i^2$ (a quadratic CEF). You run the OLS regression of $Y_i$ on $X_i$ only (without the quadratic term). Show that the OLS estimate of the slope will generally not equal $\beta$, and derive the formula for the bias in terms of $\gamma$ and the moments of $X_i$.

**2.9** Prove Corollary 2.1: if $\epsilon_i = Y_i - E[Y_i \mid \mathbf{X}_i]$, then $E[h(\mathbf{X}_i)\epsilon_i] = 0$ for any function $h(\cdot)$.

**2.10** Consider the regression of $Y_i$ on $\mathbf{X}_i$. Show that adding a variable $Z_i$ to the regression does not change the population OLS coefficient on $X_{1i}$ if and only if $Z_i$ is uncorrelated with $X_{1i}$ after partialling out the other regressors.

### Applied Questions

**2.11** Describe how you would construct the wage-schooling CEF from survey data. What would you do for each value of schooling from 0 to 20?

**2.12** The CEF of health status on income slopes upward: people with higher income have better health on average. List at least three reasons this positive association might hold, and classify each as: (a) causal (income causes health), (b) reverse causality (health causes income), (c) confounding.

**2.13** In your own words, explain why the fact that "OLS provides the best linear approximation to the CEF" is a useful result even when the CEF is non-linear.

---

## R Lab 2: Estimating the CEF and OLS Regression

### Objectives
- Compute the empirical CEF from data
- Compare the CEF to OLS regression
- Visualize the relationship between a continuous variable and an outcome

### Setup

```r
library(tidyverse)
# install.packages("quantreg")
# install.packages("AER")
library(AER)  # contains CPS1988 data

# Load CPS data on wages and education
data("CPS1988")
head(CPS1988)
```

### Exercise 2.1: Exploring the Data

```r
# Summary statistics
summary(CPS1988[, c("wage", "education", "experience", "ethnicity")])

# Log wages
CPS1988 <- CPS1988 %>%
  mutate(log_wage = log(wage))

# Distribution of education
ggplot(CPS1988, aes(x = education)) +
  geom_histogram(bins = 16, fill = "steelblue", color = "white") +
  labs(title = "Distribution of Years of Schooling", x = "Years of Education", y = "Count") +
  theme_minimal()
```

### Exercise 2.2: Estimating the Empirical CEF

```r
# Compute the empirical CEF: mean log wage for each education level
cef_data <- CPS1988 %>%
  group_by(education) %>%
  summarise(
    mean_log_wage  = mean(log_wage),
    median_log_wage = median(log_wage),
    n = n(),
    se_log_wage = sd(log_wage) / sqrt(n)
  )

print(cef_data)

# Plot the empirical CEF with confidence intervals
ggplot(cef_data, aes(x = education, y = mean_log_wage)) +
  geom_point(aes(size = n), color = "steelblue") +
  geom_line(color = "steelblue") +
  geom_ribbon(aes(ymin = mean_log_wage - 1.96 * se_log_wage,
                  ymax = mean_log_wage + 1.96 * se_log_wage),
              alpha = 0.2, fill = "steelblue") +
  labs(
    title = "Empirical CEF: Mean Log Wage by Years of Education",
    subtitle = "The CEF shows a generally increasing, approximately linear relationship",
    x = "Years of Education",
    y = "Mean Log Wage",
    size = "Sample Size"
  ) +
  theme_minimal()
```

### Exercise 2.3: OLS Regression vs. the CEF

```r
# Run OLS regression
ols_model <- lm(log_wage ~ education, data = CPS1988)
summary(ols_model)

# Add OLS fitted line to the CEF plot
ggplot(cef_data, aes(x = education, y = mean_log_wage)) +
  geom_point(color = "steelblue", size = 3) +
  geom_line(color = "steelblue", linetype = "dashed") +
  geom_smooth(
    data = CPS1988,
    aes(x = education, y = log_wage),
    method = "lm",
    se = TRUE,
    color = "red"
  ) +
  labs(
    title = "Empirical CEF vs. OLS Regression Line",
    subtitle = "Blue: Empirical CEF; Red: OLS best linear fit",
    x = "Years of Education",
    y = "Log Wage"
  ) +
  theme_minimal()
```

**Questions:**
1. Is the empirical CEF approximately linear?
2. Where does it deviate most from linearity? (Hint: look at 12 and 16 years of schooling.)
3. How does the slope of the OLS regression compare to the slope of the CEF in the linear range?

### Exercise 2.4: Residuals and the ANOVA Decomposition

```r
# Compute OLS residuals
CPS1988 <- CPS1988 %>%
  mutate(
    fitted_ols = predict(ols_model),
    resid_ols  = residuals(ols_model)
  )

# ANOVA decomposition
TSS <- var(CPS1988$log_wage)
ESS <- var(CPS1988$fitted_ols)
SSR_mean <- mean(CPS1988$resid_ols^2)

cat("Total Variance (TSS equivalent):", round(TSS, 4), "\n")
cat("Explained Variance (ESS):", round(ESS, 4), "\n")
cat("Average Residual Variance:", round(SSR_mean, 4), "\n")
cat("R-squared:", round(summary(ols_model)$r.squared, 4), "\n")
cat("Check (ESS/TSS):", round(ESS/TSS, 4), "\n")

# Does E[X * resid] = 0?
cat("Cov(education, residuals):", round(cov(CPS1988$education, CPS1988$resid_ols), 6), "\n")
```

### Exercise 2.5: Multiple Regression CEF

```r
# Multiple regression: education + experience
ols_multi <- lm(log_wage ~ education + experience + I(experience^2), data = CPS1988)
summary(ols_multi)

# Partial effect of education (controlling for experience)
# Using the FWL theorem (preview):
# Regress education on experience, get residuals
educ_resid <- residuals(lm(education ~ experience + I(experience^2), data = CPS1988))
wage_resid  <- residuals(lm(log_wage  ~ experience + I(experience^2), data = CPS1988))
fwl_model   <- lm(wage_resid ~ educ_resid)
cat("FWL estimate of education coefficient:", round(coef(fwl_model)[2], 4), "\n")
cat("Multiple regression estimate:", round(coef(ols_multi)["education"], 4), "\n")
```

**Interpretation:** The two estimates should be identical, illustrating the Frisch-Waugh-Lovell Theorem (covered in Chapter 6).

---

*End of Chapter 2*

---

**References**

Angrist, J. D., and Pischke, J. (2009). *Mostly Harmless Econometrics*. Princeton University Press. Chapter 3, Sections 3.1.1–3.1.4.

Davidson, R., and MacKinnon, J. G. (2004). *Econometric Theory and Methods*. Oxford University Press. Chapter 1.

Wooldridge, J. M. (2019). *Introductory Econometrics: A Modern Approach* (7th ed.). Cengage. Chapters 2–3.
