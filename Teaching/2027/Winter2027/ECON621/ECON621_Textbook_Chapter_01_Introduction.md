# Chapter 1: The Quest for Causality — An Introduction to Applied Econometrics

---

## Chapter Overview

This chapter introduces the central challenge of applied econometrics: distinguishing **correlation** from **causation** in economic data. We begin by asking what kinds of questions economists care about, explain why answering them with observational data is hard, and introduce the conceptual framework — the **potential outcomes model** — that modern applied economists use to think clearly about causality.

By the end of this chapter you will understand why simply comparing group averages can be deeply misleading, what it means to "identify" a causal effect, and what tools the rest of this book will give you to do so.

---

## Learning Objectives

After completing this chapter, students will be able to:

1. Define applied econometrics and explain its goals.
2. Formulate a well-posed empirical question in terms of a causal relationship.
3. Write down the **potential outcomes** (counterfactual) model for a binary treatment.
4. Define the **Average Treatment Effect (ATE)**, the **Average Treatment Effect on the Treated (ATT)**, and relate them to the observable difference in means.
5. Identify and explain **selection bias** and why it contaminates simple comparisons.
6. Explain how **random assignment** solves the selection bias problem.
7. Describe, at a high level, the identification strategies studied in this book (regression, IV, DiD, matching, RDD).

---

## 1.1 What Is Applied Econometrics?

Economists study a wide variety of questions: Does access to health insurance improve health outcomes? Do minimum wage laws cause unemployment? Does attending a smaller class improve student test scores? Does going to university raise lifetime earnings?

What unites all of these questions is that they are **causal**. We do not merely want to know whether smaller class sizes and higher test scores tend to go together in data — we want to know whether *reducing* class size *causes* test scores to rise, and by how much. The distinction matters enormously for policy. If better-resourced schools happen to have both smaller classes and better teachers, then we might find a strong correlation between class size and test scores even if class size has no causal effect whatsoever.

**Applied econometrics** is the branch of economics that uses **data and statistical methods** to estimate causal relationships and test economic theories. It sits at the intersection of economic theory, statistics, and data science, but its animating concern — separating cause from correlation — makes it distinctive.

### 1.1.1 A Map of the Terrain

Applied econometrics divides naturally into two broad activities:

1. **Estimating causal effects.** How large is the return to an additional year of schooling? Does a job-training program raise employment? By how much did a particular policy change crime rates?

2. **Testing economic theories.** Do consumers respond to prices as standard theory predicts? Is the labour supply curve upward sloping? Are financial markets informationally efficient?

This course focuses primarily on (1), but the tools we develop are equally useful for (2). Throughout, we will be careful to distinguish between **descriptive** statements (what is the world like?) and **causal** statements (what would happen if we intervened?).

### 1.1.2 Data in Applied Econometrics

Economists work with many types of data:

- **Cross-sectional data** — observations on many units (individuals, firms, countries) at a single point in time.
- **Time-series data** — observations on a single unit over many time periods.
- **Panel (longitudinal) data** — observations on many units over multiple time periods. This is the richest structure and features prominently in this book.
- **Experimental data** — data collected through randomized controlled trials (RCTs).

Each data type raises its own challenges. Observational data — data collected without deliberate experimental design — is by far the most common, and learning to draw valid causal inferences from it is the central skill of applied econometrics.

---

## 1.2 Empirical Questions and the Causal Ideal

The starting point of any empirical project is a **well-defined question**. Precision matters. Consider the following progression:

| Vague Question | Precise Causal Question |
|---|---|
| Do hospitals make people healthier? | Does hospitalization *cause* better health outcomes for elderly patients? |
| Does education matter? | Does an additional year of schooling *cause* higher lifetime earnings? |
| Is the minimum wage bad for employment? | Does a $1 increase in the minimum wage *cause* a reduction in fast-food employment? |

The precise version specifies: (a) the **cause** (the treatment or intervention), (b) the **effect** (the outcome), and (c) the **population** of interest.

### 1.2.1 Fundamental Concepts

**Definition 1.1 (Treatment):** A *treatment* is a variable $D_i$ that takes the value 1 if unit $i$ receives the intervention (is "treated") and 0 otherwise.

**Definition 1.2 (Outcome):** An *outcome* $Y_i$ is the variable we care about — earnings, health, test scores, employment.

**Definition 1.3 (Causal Effect):** The causal effect of the treatment on unit $i$ is the difference between the outcome they would experience *with* treatment and the outcome they would experience *without* treatment.

This definition immediately reveals the **fundamental problem of causal inference**: we can never observe the same unit simultaneously with and without the treatment. Whatever we observe is only one side of a counterfactual comparison.

---

## 1.3 The Potential Outcomes Framework

The most productive way to think about causal questions is the **potential outcomes framework**, originally developed by Neyman (1923) and formalized by Rubin (1974). This framework is sometimes called the **Rubin Causal Model** or the **Neyman-Rubin framework**.

### 1.3.1 Potential Outcomes Defined

For each individual $i$ in the population, define two **potential outcomes**:

$$Y_{0i} = \text{the outcome for unit } i \text{ if } D_i = 0 \text{ (not treated)}$$

$$Y_{1i} = \text{the outcome for unit } i \text{ if } D_i = 1 \text{ (treated)}$$

> **Key Insight:** Both $Y_{0i}$ and $Y_{1i}$ are defined for *every* individual, but we can only ever *observe* one of them — the one corresponding to the treatment the individual actually received.

The **individual causal effect** for unit $i$ is:

$$\tau_i = Y_{1i} - Y_{0i}$$

This is the difference that would result from "switching" the individual's treatment status, everything else held constant.

### 1.3.2 Population-Level Causal Estimands

Because $\tau_i$ varies across individuals and we cannot observe it for any individual, economists focus on **average** causal effects:

**Definition 1.4 (Average Treatment Effect):**

$$\text{ATE} = E[Y_{1i} - Y_{0i}] = E[\tau_i]$$

The ATE is the average causal effect for a randomly chosen unit from the population.

**Definition 1.5 (Average Treatment Effect on the Treated):**

$$\text{ATT} = E[Y_{1i} - Y_{0i} \mid D_i = 1]$$

The ATT is the average causal effect for individuals who actually received the treatment. This is often the more policy-relevant quantity: when a government wants to know if a training program helped the participants, it cares about the ATT.

**Definition 1.6 (Average Treatment Effect on the Untreated):**

$$\text{ATU} = E[Y_{1i} - Y_{0i} \mid D_i = 0]$$

The ATU describes what the average effect would be if the untreated were brought into the program.

> **Note on ATE vs ATT:** When treatment effects are heterogeneous (vary by individual) and treatment is not randomly assigned, ATE and ATT need not be equal. Understanding the distinction is important for interpreting estimates and for policy.

### 1.3.3 What We Observe

In any dataset, we observe the *realized* outcome:

$$Y_i = Y_{0i} + (Y_{1i} - Y_{0i}) D_i = \begin{cases} Y_{1i} & \text{if } D_i = 1 \\ Y_{0i} & \text{if } D_i = 0 \end{cases}$$

This is the **switching equation**. It links the observable data to the underlying potential outcomes.

---

## 1.4 Selection Bias: Why Simple Comparisons Mislead

The most naive approach to estimating a causal effect is to compare the average outcomes of treated and untreated units. Let us see precisely why this fails.

### 1.4.1 The Decomposition of Observed Differences

Consider the difference in mean outcomes between treated and untreated groups:

$$\underbrace{E[Y_i \mid D_i = 1] - E[Y_i \mid D_i = 0]}_{\text{Observed Difference in Means}}$$

Substituting the switching equation:

$$= E[Y_{1i} \mid D_i = 1] - E[Y_{0i} \mid D_i = 0]$$

Now add and subtract $E[Y_{0i} \mid D_i = 1]$:

$$= \underbrace{E[Y_{1i} - Y_{0i} \mid D_i = 1]}_{\text{ATT}} + \underbrace{E[Y_{0i} \mid D_i = 1] - E[Y_{0i} \mid D_i = 0]}_{\text{Selection Bias}}$$

**This is the fundamental decomposition of observed differences into causal effects and bias.**

The first term is the ATT — what we actually want to know.

The second term, **selection bias**, is the difference in average untreated outcomes between the treated and untreated groups. It captures the fact that people who select into treatment may be systematically different from those who do not.

> **Equation 1.1: Bias Decomposition**
>
> $$\underbrace{E[Y_i|D_i=1] - E[Y_i|D_i=0]}_{\text{Observed difference}} = \underbrace{\text{ATT}}_{\text{Causal effect}} + \underbrace{E[Y_{0i}|D_i=1] - E[Y_{0i}|D_i=0]}_{\text{Selection bias}}$$

### 1.4.2 A Canonical Example: Hospitals and Health

Consider the question: do hospitals make people healthier? The National Health Interview Survey (NHIS) data reveal a troubling fact — individuals who were hospitalized in the past year report *worse* health status on average than those who were not. Does this mean hospitals make you sick?

Of course not. The selection bias here runs in a clear direction: people who end up in hospitals are already, on average, much sicker than the general population. They have worse $Y_{0i}$ — they would have had worse health *even without* hospitalization. So:

$$E[Y_{0i} \mid D_i = 1] < E[Y_{0i} \mid D_i = 0]$$

The selection bias is *negative*, masking what may well be a large positive causal effect of hospitalization on health. The observable comparison between hospitalized and non-hospitalized individuals is dominated by the fact that hospitalized people were sicker to begin with.

This example, from Angrist and Pischke (2009), illustrates how selection bias can flip the apparent sign of a causal relationship.

### 1.4.3 Selection Bias in Labour Economics

A similar issue arises in estimating returns to education. People who choose to obtain more education tend to be more able, more motivated, and from higher-income families. Even if education had *zero* causal effect on earnings, we would observe a positive correlation between education and earnings because of these underlying differences.

Formally:

$$E[Y_{0i} \mid D_i = 1] > E[Y_{0i} \mid D_i = 0]$$

where $D_i = 1$ denotes more education. The selection bias is positive, and simple OLS regressions of wages on education will overstate the causal return to schooling. (We return to this in Chapters 6 and 8.)

---

## 1.5 The Gold Standard: Randomized Experiments

The cleanest solution to the selection bias problem is **random assignment**. In a randomized controlled trial (RCT), whether an individual receives treatment is determined by a coin flip (or random number generator), not by any characteristic of the individual.

### 1.5.1 Why Randomization Works

If $D_i$ is assigned randomly, then it is independent of potential outcomes:

$$\{Y_{0i}, Y_{1i}\} \perp\!\!\!\perp D_i$$

This independence condition ensures that:

$$E[Y_{0i} \mid D_i = 1] = E[Y_{0i} \mid D_i = 0] = E[Y_{0i}]$$

That is, the untreated outcomes of treated and untreated individuals are the same in expectation. **Selection bias is zero.**

As a result:

$$E[Y_i \mid D_i = 1] - E[Y_i \mid D_i = 0] = E[Y_{1i} - Y_{0i}] = \text{ATE}$$

The simple difference in group means identifies the Average Treatment Effect.

### 1.5.2 Linking Randomization to Regression

To connect experiments to the regression framework, write:

$$Y_i = \alpha + \rho D_i + \epsilon_i$$

where $\alpha = E[Y_{0i}]$, $\rho = Y_{1i} - Y_{0i}$ (assumed constant here), and $\epsilon_i = Y_{0i} - E[Y_{0i}]$.

Under random assignment, $D_i$ is independent of $Y_{0i}$, so $D_i$ is uncorrelated with $\epsilon_i$. The OLS estimator of $\rho$ from this regression recovers the causal effect:

$$\hat{\rho}^{OLS} \xrightarrow{p} \rho$$

This is the bridge between the potential outcomes framework and regression. Regression with a randomly assigned treatment variable identifies causal effects. The problem — and most of this course — is about what to do when treatment is *not* randomly assigned.

### 1.5.3 Example: Project STAR

One of the most celebrated experiments in economics is Project STAR (Student Teacher Achievement Ratio), conducted in Tennessee from 1985 to 1989. Over 11,000 students and their teachers were randomly assigned to small classes (13–17 students) or regular classes (22–26 students) from kindergarten through grade 3.

Because assignment was random, differences in test scores between students in small and large classes can be attributed to class size, not to preexisting differences in student ability or family background. Krueger (1999) found that students assigned to smaller classes scored roughly 4–5 percentile points higher on standardized tests — and that these effects were larger for minority and disadvantaged students.

This example illustrates two things: the power of randomization to answer causal questions cleanly, and the policy relevance of the answers.

> **Box 1.1 — Fundamental Questions (FUQs)**
>
> Not every empirical question can be answered even in principle. A question is a *Fundamental Unidentified Question* (FUQ) if it requires observing a counterfactual that can never be defined. For example: "What would Canada's GDP have been if it had never adopted a central bank?" The counterfactual here is so distant from any observed data that no statistical method can recover it. The potential outcomes framework helps identify which questions are FUQs and which, with clever design, can be answered.

---

## 1.6 When Experiments Are Impossible: Identification Strategies

In most economic settings, running experiments is not feasible — for ethical, practical, or financial reasons. We cannot randomly assign people to different levels of schooling, different countries to different policies, or firms to different market structures.

Applied econometrics has developed a set of **identification strategies** — methods for estimating causal effects from non-experimental (observational) data. The key insight behind each strategy is to find a source of variation in treatment that is "as good as random," even if treatment itself is not randomly assigned.

The major identification strategies covered in this book are:

| Strategy | Core Idea | Chapters |
|---|---|---|
| **Multiple Regression / OLS** | Control for observed confounders | 2–7 |
| **Instrumental Variables (IV)** | Use exogenous variation in a "third variable" | 8–9 |
| **Panel Data / Fixed Effects** | Control for time-invariant unobservables | 10 |
| **Differences-in-Differences** | Compare changes across treated and untreated groups | 11 |
| **Matching** | Match treated and untreated units on observable characteristics | 12 |
| **Regression Discontinuity** | Exploit arbitrary thresholds in treatment assignment | 13 |

Each strategy rests on a **key identifying assumption** that must be plausible given the research question and context. A major theme of this book is that we must be transparent about these assumptions and subject them to scrutiny.

### 1.6.1 The Credibility Revolution

Beginning in the 1990s, empirical economics underwent a methodological transformation sometimes called the **Credibility Revolution**. Economists increasingly insisted that empirical claims rest on transparent identification assumptions that could be argued on substantive grounds, rather than on parametric assumptions that are difficult to verify.

This shift was associated with economists like Joshua Angrist, David Card, Guido Imbens, and Alan Krueger (and recognized by the 2021 Nobel Prize in Economic Sciences, awarded to Card, Angrist, and Imbens). Their work emphasized the use of natural experiments — situations where policy changes, institutional rules, or other features of the world generate quasi-random variation in treatment — to identify causal effects.

This textbook teaches econometrics in that tradition. We will be as concerned with *research design* (which variation are we using?) as with *estimation* (how are we fitting curves to data?).

---

## 1.7 Roadmap of This Textbook

This book is organized into three parts.

**Part I: Foundations (Chapters 2–5)** develops the regression framework rigorously. We cover the Conditional Expectation Function, OLS algebra and geometry, finite-sample and asymptotic statistical properties, and modern robust inference (heteroskedasticity- and cluster-robust standard errors). This is the toolkit you will use throughout.

**Part II: The Regression Toolkit (Chapters 6–7)** extends the basic framework with essential tools: the Frisch-Waugh-Lovell theorem, omitted variable bias, dummy variables, interaction terms, and non-linearities.

**Part III: Identification Strategies (Chapters 8–13)** covers each major strategy in turn: instrumental variables, LATE, panel data, differences-in-differences, matching, and regression discontinuity. For each, we develop the theory, discuss the key assumptions, and study canonical empirical applications.

**Appendices** provide reviews of probability, matrix algebra, and R programming.

---

## Chapter Summary

- Applied econometrics aims to estimate **causal relationships** from data.
- The **potential outcomes framework** defines the causal effect of a treatment for each individual as the difference between two hypothetical outcomes — one with treatment, one without.
- Because we cannot observe both potential outcomes for the same individual, causal inference requires comparing different groups.
- **Selection bias** arises when treated and untreated units differ in their untreated potential outcomes.
- The simple observed difference in means equals the ATT plus selection bias.
- **Random assignment** eliminates selection bias by ensuring treatment is independent of potential outcomes.
- When randomization is infeasible, applied econometricians use **identification strategies** — research designs that generate quasi-random variation in treatment.
- The **Credibility Revolution** has reoriented empirical economics around transparent, design-based identification.

---

## Key Terms

**Applied econometrics** — the use of statistical methods and data to estimate economic relationships and test economic theories.

**Potential outcomes** — the hypothetical outcomes $Y_{1i}$ and $Y_{0i}$ that a unit would experience under treatment and control, respectively.

**Causal effect** — the individual-level difference $\tau_i = Y_{1i} - Y_{0i}$.

**ATE (Average Treatment Effect)** — $E[Y_{1i} - Y_{0i}]$; the average causal effect across all individuals.

**ATT (Average Treatment Effect on the Treated)** — $E[Y_{1i} - Y_{0i} \mid D_i = 1]$.

**Selection bias** — $E[Y_{0i} \mid D_i = 1] - E[Y_{0i} \mid D_i = 0]$; the difference in counterfactual outcomes between treated and untreated groups.

**Switching equation** — $Y_i = Y_{0i} + (Y_{1i} - Y_{0i})D_i$.

**Randomized controlled trial (RCT)** — a study in which treatment is assigned randomly.

**Identification strategy** — a research design that exploits quasi-random variation in treatment to estimate causal effects.

**Fundamental problem of causal inference** — the impossibility of observing both $Y_{1i}$ and $Y_{0i}$ for the same unit.

---

## Exercises

### Conceptual Questions

**1.1** Distinguish between correlation and causation. Give an example (not in this chapter) where a strong correlation does not reflect a causal relationship.

**1.2** Suppose we observe that people who wear helmets while cycling have a higher rate of cycling injuries than those who don't. Does this mean helmets cause injuries? Use the potential outcomes framework to explain the selection bias present in this comparison.

**1.3** Write down the switching equation for the following scenario: $D_i = 1$ if individual $i$ participates in a job-training program; $Y_i$ is earnings one year after the program.

**1.4** In your own words, explain the difference between the ATE and the ATT. In what situations would these two quantities be very different? In what situations would they be approximately equal?

**1.5** Explain why, in a randomized experiment, the simple difference in mean outcomes between treated and control groups identifies the ATE.

**1.6** Consider Project STAR. Explain why the fact that some students switched class-size assignments after randomization (non-compliance) complicates the interpretation of the results.

### Analytical Questions

**1.7** Suppose:
- $E[Y_{1i}] = 10$
- $E[Y_{0i}] = 6$
- $E[Y_{0i} \mid D_i = 1] = 8$
- $E[Y_{0i} \mid D_i = 0] = 5$

(a) Compute the ATE.
(b) Compute the selection bias.
(c) Compute the observed difference in means $E[Y_i \mid D_i = 1] - E[Y_i \mid D_i = 0]$, assuming constant treatment effects.
(d) Does the observed difference in means overstate or understate the ATE? Why?

**1.8** Show algebraically that when $D_i \perp \{Y_{0i}, Y_{1i}\}$ (random assignment), the selection bias term is zero and the observed difference in means equals the ATE.

**1.9** Consider a government program that provides subsidized childcare to low-income families. Describe the selection bias you would expect if you estimated the effect of the program on children's school readiness by comparing children who received subsidized care to those who did not.

### Applied Questions

**1.10** The following table shows average earnings (in \$000/year) for workers who attended university and those who did not, in a hypothetical survey:

| | Attended University | Did Not Attend | Difference |
|---|---|---|---|
| Earnings | \$65 | \$40 | \$25 |

(a) What assumption would you need to make to interpret this \$25 difference as the causal return to university education?
(b) Is this assumption plausible? Discuss the likely direction of selection bias.
(c) Propose a research design that would allow you to estimate the causal effect more credibly.

**1.11** Project STAR involved four conditions: small class, regular class, regular class with a teacher's aide. Briefly describe how you would estimate the effect of small classes relative to regular classes, assuming random assignment was perfect.

---

## R Lab 1: Introduction to R and Causal Thinking

### Objectives
- Learn basic R syntax and data manipulation
- Simulate potential outcomes data
- Illustrate the selection bias problem with simulated data
- Perform a simple comparison of means (as a naive estimator)

### Setup

```r
# Install and load necessary packages
# install.packages(c("tidyverse", "haven", "stargazer"))
library(tidyverse)
set.seed(42)
```

### Exercise 1.1: Simulating Potential Outcomes

```r
# Simulate a population of 1000 individuals
n <- 1000

# Each individual has two potential outcomes
# Y0: outcome without treatment (e.g., earnings without training)
# Y1: outcome with treatment (e.g., earnings with training)

# True individual-level treatment effect is 5 (in $000)
# But individuals with higher ability (theta) also have higher Y0
theta <- rnorm(n, mean = 10, sd = 3)   # unobserved ability

Y0 <- 30 + 2 * theta + rnorm(n, sd = 5)  # untreated earnings
Y1 <- Y0 + 5                              # treated earnings (constant +5)

# True ATE
true_ATE <- mean(Y1 - Y0)
cat("True ATE:", true_ATE, "\n")   # Should be approximately 5
```

### Exercise 1.2: Simulating Selection Bias

```r
# Now simulate NON-random treatment:
# High-ability individuals are more likely to select into treatment
prob_treat <- plogis(-5 + 0.5 * theta)   # probability of selecting treatment
D <- rbinom(n, 1, prob_treat)            # treatment indicator

# Observed outcome
Y <- D * Y1 + (1 - D) * Y0

# Naive comparison of means
mean_treated   <- mean(Y[D == 1])
mean_untreated <- mean(Y[D == 0])
naive_estimate <- mean_treated - mean_untreated

cat("Mean outcome, treated:", round(mean_treated, 2), "\n")
cat("Mean outcome, untreated:", round(mean_untreated, 2), "\n")
cat("Naive difference in means:", round(naive_estimate, 2), "\n")
cat("True ATE:", round(true_ATE, 2), "\n")
cat("Selection bias:", round(naive_estimate - true_ATE, 2), "\n")
```

**Questions:**
- How large is the selection bias in your simulation?
- In what direction does it go? Why?
- What would happen if you ran an OLS regression of Y on D? Would you recover the true ATE?

### Exercise 1.3: Simulating a Randomized Experiment

```r
# Now randomly assign treatment
D_random <- rbinom(n, 1, 0.5)
Y_random  <- D_random * Y1 + (1 - D_random) * Y0

# Compare means
rct_estimate <- mean(Y_random[D_random == 1]) - mean(Y_random[D_random == 0])
cat("RCT estimate:", round(rct_estimate, 2), "\n")
cat("True ATE:", round(true_ATE, 2), "\n")
cat("Bias under RCT:", round(rct_estimate - true_ATE, 2), "\n")

# OLS regression under random assignment
lm_rct <- lm(Y_random ~ D_random)
summary(lm_rct)
```

**Questions:**
- How does the RCT estimate compare to the true ATE?
- What is the role of the constant in the regression?
- Run the simulation 1000 times (use `replicate()`) and show that the RCT estimate is unbiased on average.

### Exercise 1.4: Visualizing Selection Bias

```r
# Create data frame
df <- data.frame(Y0 = Y0, Y1 = Y1, D = factor(D, labels = c("Untreated", "Treated")))

# Plot distributions of Y0 by treatment status
ggplot(df, aes(x = Y0, fill = D)) +
  geom_density(alpha = 0.5) +
  labs(
    title = "Distribution of Untreated Potential Outcome (Y0) by Treatment Status",
    subtitle = "Selection bias is visible: treated group has higher Y0 on average",
    x = "Untreated Potential Outcome (Y0)",
    y = "Density",
    fill = "Treatment Status"
  ) +
  theme_minimal()
```

**Interpretation:** If treatment were randomly assigned, the two distributions would overlap almost perfectly. The fact that they are separated visually confirms the presence of selection bias.

---

*End of Chapter 1*

---

**References**

Angrist, J. D., and Pischke, J. (2009). *Mostly Harmless Econometrics: An Empiricist's Companion*. Princeton University Press.

Cunningham, S. (2021). *Causal Inference: The Mixtape*. Yale University Press.

Imbens, G. W., and Rubin, D. B. (2015). *Causal Inference for Statistics, Social, and Biomedical Sciences*. Cambridge University Press.

Krueger, A. B. (1999). Experimental estimates of education production functions. *Quarterly Journal of Economics*, 114(2), 497–532.

Neyman, J. (1923). On the application of probability theory to agricultural experiments. Translated in *Statistical Science*, 5(4), 465–472.

Rubin, D. B. (1974). Estimating causal effects of treatments in randomized and nonrandomized studies. *Journal of Educational Psychology*, 66(5), 688–701.
