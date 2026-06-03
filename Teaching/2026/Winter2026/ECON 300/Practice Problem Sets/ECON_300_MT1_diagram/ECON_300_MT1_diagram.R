# PARAMETERS
G <- 800
t <- 0.4
w <- 25
T <- 60

# Leisure grid INCLUDING endpoints
L <- seq(0, T, length.out = 400)

# Budget constraints
C_no <- w * (T - L)
C_gi <- G + (1 - t) * w * (T - L)

# Colors
col_no <- "black"
col_gi <- "steelblue"

# PLOT
plot(L, C_no, type = "l",
     lwd = 2,
     col = col_no,
     xlab = "Leisure (L)",
     ylab = "Income",
     xlim = c(0, T),
     ylim = c(0, max(C_gi)*1.1),
     main = "Income Maintenance Program Budget Constraint")

# Add guaranteed income budget line
lines(L, C_gi, lwd = 2, lty = 2, col = col_gi)

legend("topright",
       legend = c("No income maintenance", "With guaranteed income"),
       lwd = 2, lty = c(1,2),
       col = c(col_no, col_gi),
       bty = "n")

# ===== CONNECT LINES TO AXES (explicit endpoints) =====

# No-program endpoints
segments(0, w*T, 0, 0, lty=1, col="gray70")   # vertical axis connection
segments(T, 0, 0, 0, lty=1, col="gray70")     # horizontal axis connection

# Program intercept guides
segments(0, G, T, G, lty=3)   # horizontal guide at G
segments(T, 0, T, G, lty=3)   # vertical guide to G

# ===== KEY POINTS =====
points(T, 0, pch = 19)
points(0, w*T, pch = 19)
points(T, G, pch = 19)
points(0, G + (1 - t)*w*T, pch = 19)

# ===== LABEL VALUES =====
text(T, -40, "T = 60", xpd=TRUE)
text(-4, G, "G = 800", xpd=TRUE)
text(-4, -40, "0", xpd=TRUE)

text(3, w*T, "(0, 1500)", pos = 4)
text(3, G + (1 - t)*w*T, "(0, 1700)", pos = 4, col = col_gi)

text(T-8, 80, "(60, 0)")
text(T-10, G+40, "(60, 800)", col = col_gi)

# ===== SLOPE LABELS =====
midL <- 30

text(midL, w*(T-midL)+120,
     "Slope = -w",
     col = col_no)

text(midL, G + (1-t)*w*(T-midL)+120,
     "Slope = -(1-t)w",
     col = col_gi)