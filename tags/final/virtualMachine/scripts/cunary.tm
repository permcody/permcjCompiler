* Begin Prolog code
  0:     LD  0,0(0) 	load global poiniter with end of memory
  1:    LDA  1,0(0) 	load fp
  2:     ST  1,0(1) 	store old fp
  3:    LDA  3,1(7) 	return address in ac
  5:   HALT  0,0,0 	DONE!
* End Prolog code
* Being Generating IO Functions
* Begin function input
  6:     ST  3,-1(1) 	store return address
  7:     IN  2,2,2 	input integer
  8:     LD  3,-1(1) 	load return address
  9:     LD  1,0(1) 	adjust fp
 10:    LDA  7,0(3) 	jump to return address
* End function input
* Begin function output
 11:     ST  3,-1(1) 	store return address
 12:     LD  3,-2(1) 	load parameter
 13:    OUT  3,3,3 	output integer
 14:    LDC  2,0(2) 	set return to 0
 15:     LD  3,-1(1) 	load return address
 16:     LD  1,0(1) 	adjust fp
 17:    LDA  7,0(3) 	jump to return address
* End function output
* Begin function inputb
 18:     ST  3,-1(1) 	store return address
 19:    INB  2,2,2 	input boolean
 20:     LD  3,-1(1) 	load return address
 21:     LD  1,0(1) 	adjust fp
 22:    LDA  7,0(3) 	jump to return address
* End function inputb
* Begin function outputb
 23:     ST  3,-1(1) 	store return address
 24:     LD  3,-2(1) 	load parameter
 25:   OUTB  3,3,3 	output boolean
 26:    LDC  2,0(2) 	set return to 0
 27:     LD  3,-1(1) 	load return address
 28:     LD  1,0(1) 	adjust fp
 29:    LDA  7,0(3) 	jump to return address
* End function outputb
* End Generating IO Functions
 30:     ST  3,-1(1) 	store return address
  4:    LDA  7,25(7) 	jump to main
* Function main returns void
* BEGIN
 31:    LDC  3,88(6) 	load constant
 32:     ST  3,-2(1) 	store variable x
* 
 33:     LD  3,-2(1) 	load variable x
 34:     ST  3,-6(1) 	save left side
 35:    LDC  3,9(6) 	load constant
 36:     LD  4,-6(1) 	load left into ac1
 37:    SUB  3,4,3 	op -
 38:     ST  3,-3(1) 	store variable y
* 
 39:     LD  3,-2(1) 	load variable x
 40:    LDC  4,0(6) 	Load zero in ac1 for unary -
 41:    SUB  3,4,3 	op unary -
 42:     ST  3,-3(1) 	store variable y
* 
 43:     ST  1,-6(1) 	Store old fp in ghost frame
 44:     LD  3,-2(1) 	load variable x
 45:    LDC  4,0(6) 	Load zero in ac1 for unary -
 46:    SUB  3,4,3 	op unary -
 47:     ST  3,-8(1) 	Save parameter
 48:    LDA  1,-6(1) 	Load address of new frame
 49:    LDA  3,1(7) 	Put return address in ac
 50:    LDA  7,-40(7) 	Call output
 51:    LDA  3,0(2) 	Save the result in ac
* 
 52:     ST  1,-6(1) 	Store old fp in ghost frame
 53:     LD  3,-3(1) 	load variable y
 54:     ST  3,-8(1) 	Save parameter
 55:    LDA  1,-6(1) 	Load address of new frame
 56:    LDA  3,1(7) 	Put return address in ac
 57:    LDA  7,-47(7) 	Call output
 58:    LDA  3,0(2) 	Save the result in ac
* 
 59:     ST  1,-6(1) 	Store old fp in ghost frame
 60:    LDC  3,3(6) 	load constant
 61:    LDC  4,0(6) 	Load zero in ac1 for unary -
 62:    SUB  3,4,3 	op unary -
 63:    LDC  4,0(6) 	Load zero in ac1 for unary -
 64:    SUB  3,4,3 	op unary -
 65:     ST  3,-8(1) 	save left side
 66:    LDC  3,5(6) 	load constant
 67:    LDC  4,0(6) 	Load zero in ac1 for unary -
 68:    SUB  3,4,3 	op unary -
 69:     LD  4,-8(1) 	load left into ac1
 70:    MUL  3,4,3 	op *
 71:     ST  3,-8(1) 	Save parameter
 72:    LDA  1,-6(1) 	Load address of new frame
 73:    LDA  3,1(7) 	Put return address in ac
 74:    LDA  7,-64(7) 	Call output
 75:    LDA  3,0(2) 	Save the result in ac
* 
 76:     ST  1,-6(1) 	Store old fp in ghost frame
 77:    LDC  3,3(6) 	load constant
 78:    LDC  4,0(6) 	Load zero in ac1 for unary -
 79:    SUB  3,4,3 	op unary -
 80:    LDC  4,0(6) 	Load zero in ac1 for unary -
 81:    SUB  3,4,3 	op unary -
 82:     ST  3,-8(1) 	Save parameter
 83:    LDA  1,-6(1) 	Load address of new frame
 84:    LDA  3,1(7) 	Put return address in ac
 85:    LDA  7,-75(7) 	Call output
 86:    LDA  3,0(2) 	Save the result in ac
* 
* BEGIN
 87:    LDC  3,1(6) 	load constant
 88:     ST  3,-4(1) 	store variable x
* 
 89:     LD  3,-4(1) 	load variable x
 90:    JEQ  3,2(7) 	op !
 91:    LDC  3,0(6) 	load false into ac
 92:    LDA  7,1(7) 	jump past true case
 93:    LDC  3,1(6) 	load true into ac
 94:     ST  3,-5(1) 	store variable y
* 
 95:     ST  1,-6(1) 	Store old fp in ghost frame
 96:     LD  3,-4(1) 	load variable x
 97:    JEQ  3,2(7) 	op !
 98:    LDC  3,0(6) 	load false into ac
 99:    LDA  7,1(7) 	jump past true case
100:    LDC  3,1(6) 	load true into ac
101:     ST  3,-8(1) 	Save parameter
102:    LDA  1,-6(1) 	Load address of new frame
103:    LDA  3,1(7) 	Put return address in ac
104:    LDA  7,-82(7) 	Call outputb
105:    LDA  3,0(2) 	Save the result in ac
* 
106:     ST  1,-6(1) 	Store old fp in ghost frame
107:     LD  3,-5(1) 	load variable y
108:     ST  3,-8(1) 	Save parameter
109:    LDA  1,-6(1) 	Load address of new frame
110:    LDA  3,1(7) 	Put return address in ac
111:    LDA  7,-89(7) 	Call outputb
112:    LDA  3,0(2) 	Save the result in ac
* 
113:     ST  1,-6(1) 	Store old fp in ghost frame
114:     LD  3,-4(1) 	load variable x
115:    JEQ  3,2(7) 	op !
116:    LDC  3,0(6) 	load false into ac
117:    LDA  7,1(7) 	jump past true case
118:    LDC  3,1(6) 	load true into ac
119:    JEQ  3,2(7) 	op !
120:    LDC  3,0(6) 	load false into ac
121:    LDA  7,1(7) 	jump past true case
122:    LDC  3,1(6) 	load true into ac
123:     ST  3,-8(1) 	save left side
124:     LD  3,-5(1) 	load variable y
125:    JEQ  3,2(7) 	op !
126:    LDC  3,0(6) 	load false into ac
127:    LDA  7,1(7) 	jump past true case
128:    LDC  3,1(6) 	load true into ac
129:     LD  4,-8(1) 	load left into ac1
130:    ADD  3,4,3 	prepare for && op
131:    LDC  4,2(6) 	load constant for &&
132:    SUB  3,4,3 	compute value in ac
133:    JEQ  3,2(7) 	op &&
134:    LDC  3,0(6) 	load false into ac
135:    LDA  7,1(7) 	jump past true case
136:    LDC  3,1(6) 	load true into ac
137:     ST  3,-8(1) 	Save parameter
138:    LDA  1,-6(1) 	Load address of new frame
139:    LDA  3,1(7) 	Put return address in ac
140:    LDA  7,-118(7) 	Call outputb
141:    LDA  3,0(2) 	Save the result in ac
* 
142:     ST  1,-6(1) 	Store old fp in ghost frame
143:     LD  3,-4(1) 	load variable x
144:    JEQ  3,2(7) 	op !
145:    LDC  3,0(6) 	load false into ac
146:    LDA  7,1(7) 	jump past true case
147:    LDC  3,1(6) 	load true into ac
148:    JEQ  3,2(7) 	op !
149:    LDC  3,0(6) 	load false into ac
150:    LDA  7,1(7) 	jump past true case
151:    LDC  3,1(6) 	load true into ac
152:     ST  3,-8(1) 	save left side
153:     LD  3,-5(1) 	load variable y
154:    JEQ  3,2(7) 	op !
155:    LDC  3,0(6) 	load false into ac
156:    LDA  7,1(7) 	jump past true case
157:    LDC  3,1(6) 	load true into ac
158:     LD  4,-8(1) 	load left into ac1
159:    ADD  3,4,3 	prepare for || op
160:    JGT  3,2(7) 	op ||
161:    LDC  3,0(6) 	load false into ac
162:    LDA  7,1(7) 	jump past true case
163:    LDC  3,1(6) 	load true into ac
164:     ST  3,-8(1) 	Save parameter
165:    LDA  1,-6(1) 	Load address of new frame
166:    LDA  3,1(7) 	Put return address in ac
167:    LDA  7,-145(7) 	Call outputb
168:    LDA  3,0(2) 	Save the result in ac
* 
169:     ST  1,-6(1) 	Store old fp in ghost frame
170:     LD  3,-5(1) 	load variable y
171:    JEQ  3,2(7) 	op !
172:    LDC  3,0(6) 	load false into ac
173:    LDA  7,1(7) 	jump past true case
174:    LDC  3,1(6) 	load true into ac
175:    JEQ  3,2(7) 	op !
176:    LDC  3,0(6) 	load false into ac
177:    LDA  7,1(7) 	jump past true case
178:    LDC  3,1(6) 	load true into ac
179:     ST  3,-8(1) 	save left side
180:     LD  3,-4(1) 	load variable x
181:    JEQ  3,2(7) 	op !
182:    LDC  3,0(6) 	load false into ac
183:    LDA  7,1(7) 	jump past true case
184:    LDC  3,1(6) 	load true into ac
185:     LD  4,-8(1) 	load left into ac1
186:    ADD  3,4,3 	prepare for || op
187:    JGT  3,2(7) 	op ||
188:    LDC  3,0(6) 	load false into ac
189:    LDA  7,1(7) 	jump past true case
190:    LDC  3,1(6) 	load true into ac
191:     ST  3,-8(1) 	Save parameter
192:    LDA  1,-6(1) 	Load address of new frame
193:    LDA  3,1(7) 	Put return address in ac
194:    LDA  7,-172(7) 	Call outputb
195:    LDA  3,0(2) 	Save the result in ac
* 
196:     ST  1,-6(1) 	Store old fp in ghost frame
197:     LD  3,-4(1) 	load variable x
198:    JEQ  3,2(7) 	op !
199:    LDC  3,0(6) 	load false into ac
200:    LDA  7,1(7) 	jump past true case
201:    LDC  3,1(6) 	load true into ac
202:    JEQ  3,2(7) 	op !
203:    LDC  3,0(6) 	load false into ac
204:    LDA  7,1(7) 	jump past true case
205:    LDC  3,1(6) 	load true into ac
206:     ST  3,-8(1) 	Save parameter
207:    LDA  1,-6(1) 	Load address of new frame
208:    LDA  3,1(7) 	Put return address in ac
209:    LDA  7,-187(7) 	Call outputb
210:    LDA  3,0(2) 	Save the result in ac
* END
* END
* Add standard closing in case there is no return statement
211:    LDC  2,0(6) 	Set return value to 0
212:     LD  3,-1(1) 	Load return address
213:     LD  1,0(1) 	Adjust fp
214:    LDA  7,0(3) 	Return
* End Function main
