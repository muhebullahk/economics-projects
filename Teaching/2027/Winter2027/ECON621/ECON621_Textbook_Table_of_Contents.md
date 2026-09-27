# Applied Econometrics: A Textbook for ECON 621
## Table of Contents

**Course:** ECON 621 – Applied Econometrics (Cross-listed: senior undergraduate / graduate)  
**Institution:** University of Northern British Columbia  

---

## Preface

## Part I: Foundations

### Chapter 1: The Quest for Causality — An Introduction to Applied Econometrics
- 1.1 What Is Applied Econometrics?
- 1.2 Empirical Questions and the Causal Ideal
- 1.3 The Potential Outcomes Framework
- 1.4 Selection Bias: Why Simple Comparisons Mislead
- 1.5 The Gold Standard: Randomized Experiments
- 1.6 When Experiments Are Impossible: Identification Strategies
- 1.7 Roadmap of This Textbook
- Key Terms | Exercises | R Lab

### Chapter 2: The Conditional Expectation Function and Linear Regression
- 2.1 Describing Relationships: From Scatter Plots to Functions
- 2.2 The Conditional Expectation Function (CEF)
- 2.3 The Law of Iterated Expectations
- 2.4 The CEF Decomposition and Its Properties
- 2.5 Why Linear Regression?
- 2.6 OLS as the Best Linear Approximation to the CEF
- 2.7 Empirical Illustration: Education and Wages
- Key Terms | Exercises | R Lab

### Chapter 3: Ordinary Least Squares — Algebra and Geometry
- 3.1 The Multiple Regression Model
- 3.2 The OLS Estimator: Derivation via Method of Moments
- 3.3 OLS Derivation via Minimization
- 3.4 Linear Regression as Orthogonal Projection
- 3.5 Projection Matrices: P_X and M_X
- 3.6 The Pythagorean Theorem and Goodness of Fit (R²)
- 3.7 Linear Transformations and Invariance Results
- Key Terms | Exercises | R Lab

### Chapter 4: Statistical Properties of OLS — Finite Sample Theory
- 4.1 Setting Up the Framework: Classical Assumptions
- 4.2 Unbiasedness of OLS
- 4.3 The Variance-Covariance Matrix of OLS
- 4.4 The Gauss-Markov Theorem: OLS is BLUE
- 4.5 Inference Under Normality
- 4.6 t-Tests, F-Tests, and Confidence Intervals
- Key Terms | Exercises | R Lab

### Chapter 5: Asymptotic Theory and Robust Inference
- 5.1 Why Asymptotic Theory?
- 5.2 Consistency of OLS
- 5.3 Asymptotic Normality and the Sandwich Variance
- 5.4 Heteroskedasticity-Robust Standard Errors
- 5.5 Cluster-Robust Standard Errors
- 5.6 When to Cluster? Practical Guidance
- 5.7 Empirical Illustration: Wages and Education Revisited
- Key Terms | Exercises | R Lab

---

## Part II: The Regression Toolkit

### Chapter 6: The Frisch-Waugh-Lovell Theorem and Omitted Variable Bias
- 6.1 Partitioned Regression
- 6.2 The FWL Theorem: Statement and Proof
- 6.3 The FWL Theorem in Practice
- 6.4 Omitted Variable Bias: Formula and Direction
- 6.5 Proxy Variables and Bad Controls
- 6.6 Empirical Illustration: Returns to Education
- Key Terms | Exercises | R Lab

### Chapter 7: Regression with Special Regressors: Dummies, Interactions, and Non-linearities
- 7.1 Binary and Categorical Variables
- 7.2 Interaction Terms
- 7.3 Polynomial and Logarithmic Transformations
- 7.4 Non-linear CEFs and Flexible Regression
- 7.5 Heterogeneous Treatment Effects and Regression
- 7.6 Weighting and Weighted Least Squares
- Key Terms | Exercises | R Lab

---

## Part III: Identification Strategies

### Chapter 8: Instrumental Variables and Two-Stage Least Squares
- 8.1 The Endogeneity Problem
- 8.2 The Instrumental Variables (IV) Estimator
- 8.3 Two-Stage Least Squares (2SLS): The General Case
- 8.4 Asymptotic Properties of 2SLS
- 8.5 Instrument Validity: Relevance and Exclusion
- 8.6 Weak Instruments: Diagnosis and Remedies
- 8.7 Empirical Illustration: Angrist and Krueger (1991)
- Key Terms | Exercises | R Lab

### Chapter 9: Heterogeneous Treatment Effects and the Local Average Treatment Effect
- 9.1 The Constant-Effects Model and Its Limitations
- 9.2 The Potential Outcomes Framework Revisited
- 9.3 SUTVA and the Definition of Causal Effects
- 9.4 Compliance Types: Always-Takers, Never-Takers, Compliers, Defiers
- 9.5 The Four LATE Assumptions
- 9.6 The LATE Theorem (Imbens and Angrist, 1994)
- 9.7 2SLS as LATE with Multiple Instruments
- 9.8 Empirical Illustrations
- Key Terms | Exercises | R Lab

### Chapter 10: Panel Data and Fixed Effects
- 10.1 Why Panel Data? The Unobserved Heterogeneity Problem
- 10.2 Structure of Panel Data
- 10.3 The Pooled OLS Estimator and Its Failure
- 10.4 The Within (Fixed Effects) Estimator
- 10.5 The First-Differences Estimator
- 10.6 The LSDV Representation
- 10.7 Random Effects and the Hausman Test
- 10.8 Two-Way Fixed Effects
- 10.9 Empirical Illustration: Card (1995)
- Key Terms | Exercises | R Lab

### Chapter 11: Differences-in-Differences
- 11.1 The 2×2 Differences-in-Differences Setup
- 11.2 The Parallel Trends Assumption
- 11.3 The DiD Estimator: Regression Formulation
- 11.4 Standard Errors in DiD: Clustering
- 11.5 Testing Parallel Trends: Event Study Plots
- 11.6 Staggered DiD and Recent Advances
- 11.7 Empirical Illustration: Card and Krueger (1994)
- Key Terms | Exercises | R Lab

### Chapter 12: Matching and Selection on Observables
- 12.1 The Conditional Independence Assumption (CIA)
- 12.2 Sub-classification and Propensity Score Matching
- 12.3 Regression as a Form of Matching
- 12.4 The Propensity Score Theorem
- 12.5 Propensity Score Matching Estimators
- 12.6 Overlap and Common Support
- 12.7 Practical Guidance: When to Match?
- 12.8 Empirical Illustration
- Key Terms | Exercises | R Lab

### Chapter 13: Regression Discontinuity Design
- 13.1 The Regression Discontinuity Idea
- 13.2 The Sharp RDD
- 13.3 Identification in the Sharp RDD
- 13.4 Estimation: Local Linear Regression and Bandwidth Choice
- 13.5 The Fuzzy RDD and Its Relationship to IV
- 13.6 Validity Tests: Density Tests and Covariate Balance
- 13.7 Empirical Illustration: Thistlethwaite and Campbell (1960)
- Key Terms | Exercises | R Lab

---

## Appendix A: Probability and Statistics Review
## Appendix B: Matrix Algebra Review
## Appendix C: Introduction to R for Econometrics
## Appendix D: Data Sources for Applied Work

---

*This textbook is prepared for ECON 621 (Applied Econometrics) at the University of Northern British Columbia. It draws on the graduate course ECON 712 and the following foundational works: Angrist and Pischke (2009), Davidson and MacKinnon (2004), Cunningham (2021), and Wooldridge (2019).*
