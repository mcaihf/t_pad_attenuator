# Amp Output ---- R1 ----+---- R2 ----+
#                        |            |
#                        |            |
#                        R3        speaker
#                        |            |
#                        |            |
#     Ground ------------+------------+

# Declare part values
R_speaker = 8
P_amp = 100

fprintf('\n')

# Desired speaker power
P_speaker = 10
I_speaker = sqrt(P_speaker / R_speaker);

fprintf('\n')

# Calculate Currents
I_R2 = I_speaker;
I_amp = sqrt(P_amp / R_speaker);
I_R1 = I_amp;
I_R3 = I_amp - I_R2;

# System of equations
# Rearrangement of Total resistance assuming R_amp == R_speaker and R1 == R2
#           R2 * (R2 + 2 * R3) = R_speaker * R_speaker
# Current in parallel paths are related to their resistance
#           (R_speaker + R2) / R3 = I_R3 / I_speaker
syms R1 R3
eqns = [ R1 * (R1 + 2 * R3) == R_speaker * R_speaker, (R_speaker + R1) / R3 == I_R3 / I_speaker ];
S = solve(eqns, [R1, R3]);

R1 = double(S.R1)
R2 = R1
R3 = double(S.R3)

# Check R_amp ~= R_speaker
R_amp = R1 + ( R3 * ( R2 + R_speaker ) / ( R3 + R2 + R_speaker ) )

# Calculate Power requirements
P_R1 = I_amp * I_amp * R1
P_R2 = I_R2 * I_R2 * R2
P_R3 = I_R3 * I_R3 * R3
P_total = P_R1 + P_R2 + P_R3 + P_speaker
