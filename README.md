
---

# README 2: Comparative Study of FOC and DTC

```markdown
# Comparative Study of Field-Oriented Control and Direct Torque Control

## Project Overview

This project presents a comparative study of Field-Oriented Control and Direct Torque Control for electric motor drive applications. Both control techniques are widely used in high-performance AC motor drives, especially for induction motors and permanent magnet synchronous motors.

The objective of this project is to compare FOC and DTC based on torque response, flux control, dynamic performance, switching behavior, implementation complexity, and suitability for electric drive applications.

---

## Control Techniques Studied

The two control strategies analyzed in this project are:

- Field-Oriented Control
- Direct Torque Control

---

## Field-Oriented Control

Field-Oriented Control is a vector control technique in which the stator current is resolved into two components in the rotating dq reference frame:

- Direct-axis current component, `id`
- Quadrature-axis current component, `iq`

The direct-axis current controls the flux, while the quadrature-axis current controls the torque.

For a PMSM drive, the electromagnetic torque can be expressed as:

```math
T_e = \frac{3}{2} P \left[ \lambda_m i_q + (L_d - L_q)i_d i_q \right]
