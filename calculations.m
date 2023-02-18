# Amp Output ---- R1 ----+---- R2 ----+
#                        |            |
#                        |            |
#                        R3        speaker
#                        |            |
#                        |            |
#     Ground ------------+------------+

# attenuation ~= 1/100
# R1 and R2 = 6.8 ohms
# R3 = 1.5 ohms

# Declare part values
R_speaker = 8
P_amp = 100
R1 = 3.9
R2 = R1
R3 = 5.6

fprintf('\n')

# Check R_amp ~= R_speaker
R_amp = R1 + ( R3 * ( R2 + R_speaker ) / ( R3 + R2 + R_speaker ) )

fprintf('\n')

# Calculate Power requirements
I_amp = sqrt(P_amp / R_amp);
P_R1 = I_amp * I_amp * R1

I_R2 = I_amp * R3 / ( R3 + R2 + R_speaker );
P_R2 = I_R2 * I_R2 * R2

I_R3 = I_amp * ( R2 + R_speaker ) / ( R3 + R2 + R_speaker );
P_R3 = I_R3 * I_R3 * R3

I_speaker = I_R2;
P_speaker = I_speaker * I_speaker * R_speaker

fprintf('\n')

# Check P_amp ~= P_total
P_total = P_R1 + P_R2 + P_R3 + P_speaker
