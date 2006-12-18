* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,-22(0) 	set first frame at end of globals 
  2:     ST  1,0(1) 	store old fp (point to self) 
  3:    LDA  3,1(7) 	Return address in ac 
  5:   HALT  0,0,0 	DONE! 
* END Prolog
* BEGIN function input
  6:     ST  3,-1(1) 	Store return address 
  7:     IN  2,2,2 	Grab int input 
  8:     LD  3,-1(1) 	Load return address 
  9:     LD  1,0(1) 	Adjust fp 
 10:    LDA  7,0(3) 	Return 
* END of function input
* BEGIN function output
 11:     ST  3,-1(1) 	Store return address 
 12:     LD  3,-2(1) 	Load parameter 
 13:    OUT  3,3,3 	Output integer 
 14:    LDC  2,0(6) 	Set return to 0 
 15:     LD  3,-1(1) 	Load return address 
 16:     LD  1,0(1) 	Adjust fp 
 17:    LDA  7,0(3) 	Return 
* END of function output
* BEGIN function inputb
 18:     ST  3,-1(1) 	Store return address 
 19:    INB  2,2,2 	Grab bool input 
 20:     LD  3,-1(1) 	Load return address 
 21:     LD  1,0(1) 	Adjust fp 
 22:    LDA  7,0(3) 	Return 
* END of function inputb
* BEGIN function outputb
 23:     ST  3,-1(1) 	Store return address 
 24:     LD  3,-2(1) 	Load parameter 
 25:   OUTB  3,3,3 	Output bool 
 26:    LDC  2,0(6) 	Set return to 0 
 27:     LD  3,-1(1) 	Load return address 
 28:     LD  1,0(1) 	Adjust fp 
 29:    LDA  7,0(3) 	Return 
* END of function outputb
* BEGIN function outnl
 30:     ST  3,-1(1) 	Store return address 
 31:  OUTNL  3,3,3 	Output a newline 
 32:     LD  3,-1(1) 	Load return address 
 33:     LD  1,0(1) 	Adjust fp 
 34:    LDA  7,0(3) 	Return 
* END of function outnl
* BEGIN function main
  4:    LDA  7,30(7) 	Jump to main 
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 10
 36:    LDC  3,5(6) 	Load constant 
 37:     ST  3,-28(1) 	Save index in temp 
 38:    LDC  3,111(6) 	Load constant 
 39:     LD  4,-28(1) 	load index from temp to ac1 
 40:    LDA  5,-2(1) 	Load address of base of array x
 41:    SUB  5,5,4 	Compute offset of value 
 42:     ST  3,0(5) 	Store variable x
* 11
 43:     ST  1,-28(1) 	Store old fp in ghost frame 
 44:    LDC  3,5(6) 	Load constant 
 45:    LDA  4,-2(1) 	Load address of base of array x
 46:    SUB  3,4,3 	Compute offset of value 
 47:     LD  3,0(3) 	Load the value 
 48:     ST  3,-30(1) 	Store parameter 
 49:    LDA  1,-28(1) 	Load address of new frame 
 50:    LDA  3,1(7) 	Return address in ac 
 51:    LDA  7,-41(7) 	call output
 52:    LDA  3,0(2) 	Save the result in ac 
* 12
 53:    LDC  3,4(6) 	Load constant 
 54:     ST  3,-28(1) 	Save index in temp 
 55:    LDC  3,222(6) 	Load constant 
 56:     LD  4,-28(1) 	load index from temp to ac1 
 57:    LDA  5,-10(1) 	Load address of base of array y
 58:    SUB  5,5,4 	Compute offset of value 
 59:     ST  3,0(5) 	Store variable y
* 13
 60:     ST  1,-28(1) 	Store old fp in ghost frame 
 61:    LDC  3,4(6) 	Load constant 
 62:    LDA  4,-10(1) 	Load address of base of array y
 63:    SUB  3,4,3 	Compute offset of value 
 64:     LD  3,0(3) 	Load the value 
 65:     ST  3,-30(1) 	Store parameter 
 66:    LDA  1,-28(1) 	Load address of new frame 
 67:    LDA  3,1(7) 	Return address in ac 
 68:    LDA  7,-58(7) 	call output
 69:    LDA  3,0(2) 	Save the result in ac 
* 14
 70:    LDC  3,3(6) 	Load constant 
 71:     ST  3,-28(1) 	Save index in temp 
 72:    LDC  3,1(6) 	Load constant 
 73:     LD  4,-28(1) 	load index from temp to ac1 
 74:    LDA  5,-17(1) 	Load address of base of array a
 75:    SUB  5,5,4 	Compute offset of value 
 76:     ST  3,0(5) 	Store variable a
* 15
 77:     ST  1,-28(1) 	Store old fp in ghost frame 
 78:    LDC  3,3(6) 	Load constant 
 79:    LDA  4,-17(1) 	Load address of base of array a
 80:    SUB  3,4,3 	Compute offset of value 
 81:     LD  3,0(3) 	Load the value 
 82:     ST  3,-30(1) 	Store parameter 
 83:    LDA  1,-28(1) 	Load address of new frame 
 84:    LDA  3,1(7) 	Return address in ac 
 85:    LDA  7,-63(7) 	call outputb
 86:    LDA  3,0(2) 	Save the result in ac 
* 16
 87:    LDC  3,2(6) 	Load constant 
 88:     ST  3,-28(1) 	Save index in temp 
 89:    LDC  3,0(6) 	Load constant 
 90:     LD  4,-28(1) 	load index from temp to ac1 
 91:    LDA  5,-23(1) 	Load address of base of array b
 92:    SUB  5,5,4 	Compute offset of value 
 93:     ST  3,0(5) 	Store variable b
* 17
 94:     ST  1,-28(1) 	Store old fp in ghost frame 
 95:    LDC  3,2(6) 	Load constant 
 96:    LDA  4,-23(1) 	Load address of base of array b
 97:    SUB  3,4,3 	Compute offset of value 
 98:     LD  3,0(3) 	Load the value 
 99:     ST  3,-30(1) 	Store parameter 
100:    LDA  1,-28(1) 	Load address of new frame 
101:    LDA  3,1(7) 	Return address in ac 
102:    LDA  7,-80(7) 	call outputb
103:    LDA  3,0(2) 	Save the result in ac 
* 18
104:     ST  1,-28(1) 	Store old fp in ghost frame 
105:    LDA  1,-28(1) 	Load address of new frame 
106:    LDA  3,1(7) 	Return address in ac 
107:    LDA  7,-78(7) 	call outnl
108:    LDA  3,0(2) 	Save the result in ac 
* 20
109:    LDC  3,5(6) 	Load constant 
110:     ST  3,-28(1) 	Save index in temp 
111:    LDC  3,333(6) 	Load constant 
112:     LD  4,-28(1) 	load index from temp to ac1 
113:    LDA  5,0(0) 	Load address of base of array gx
114:    SUB  5,5,4 	Compute offset of value 
115:     ST  3,0(5) 	Store variable gx
* 21
116:     ST  1,-28(1) 	Store old fp in ghost frame 
117:    LDC  3,5(6) 	Load constant 
118:    LDA  4,0(0) 	Load address of base of array gx
119:    SUB  3,4,3 	Compute offset of value 
120:     LD  3,0(3) 	Load the value 
121:     ST  3,-30(1) 	Store parameter 
122:    LDA  1,-28(1) 	Load address of new frame 
123:    LDA  3,1(7) 	Return address in ac 
124:    LDA  7,-114(7) 	call output
125:    LDA  3,0(2) 	Save the result in ac 
* 22
126:    LDC  3,4(6) 	Load constant 
127:     ST  3,-28(1) 	Save index in temp 
128:    LDC  3,444(6) 	Load constant 
129:     LD  4,-28(1) 	load index from temp to ac1 
130:    LDA  5,-7(0) 	Load address of base of array gy
131:    SUB  5,5,4 	Compute offset of value 
132:     ST  3,0(5) 	Store variable gy
* 23
133:     ST  1,-28(1) 	Store old fp in ghost frame 
134:    LDC  3,4(6) 	Load constant 
135:    LDA  4,-7(0) 	Load address of base of array gy
136:    SUB  3,4,3 	Compute offset of value 
137:     LD  3,0(3) 	Load the value 
138:     ST  3,-30(1) 	Store parameter 
139:    LDA  1,-28(1) 	Load address of new frame 
140:    LDA  3,1(7) 	Return address in ac 
141:    LDA  7,-131(7) 	call output
142:    LDA  3,0(2) 	Save the result in ac 
* 24
143:    LDC  3,3(6) 	Load constant 
144:     ST  3,-28(1) 	Save index in temp 
145:    LDC  3,0(6) 	Load constant 
146:     LD  4,-28(1) 	load index from temp to ac1 
147:    LDA  5,-13(0) 	Load address of base of array ga
148:    SUB  5,5,4 	Compute offset of value 
149:     ST  3,0(5) 	Store variable ga
* 25
150:     ST  1,-28(1) 	Store old fp in ghost frame 
151:    LDC  3,3(6) 	Load constant 
152:    LDA  4,-13(0) 	Load address of base of array ga
153:    SUB  3,4,3 	Compute offset of value 
154:     LD  3,0(3) 	Load the value 
155:     ST  3,-30(1) 	Store parameter 
156:    LDA  1,-28(1) 	Load address of new frame 
157:    LDA  3,1(7) 	Return address in ac 
158:    LDA  7,-136(7) 	call outputb
159:    LDA  3,0(2) 	Save the result in ac 
* 26
160:    LDC  3,2(6) 	Load constant 
161:     ST  3,-28(1) 	Save index in temp 
162:    LDC  3,1(6) 	Load constant 
163:     LD  4,-28(1) 	load index from temp to ac1 
164:    LDA  5,-18(0) 	Load address of base of array gb
165:    SUB  5,5,4 	Compute offset of value 
166:     ST  3,0(5) 	Store variable gb
* 27
167:     ST  1,-28(1) 	Store old fp in ghost frame 
168:    LDC  3,2(6) 	Load constant 
169:    LDA  4,-18(0) 	Load address of base of array gb
170:    SUB  3,4,3 	Compute offset of value 
171:     LD  3,0(3) 	Load the value 
172:     ST  3,-30(1) 	Store parameter 
173:    LDA  1,-28(1) 	Load address of new frame 
174:    LDA  3,1(7) 	Return address in ac 
175:    LDA  7,-153(7) 	call outputb
176:    LDA  3,0(2) 	Save the result in ac 
* 28
177:     ST  1,-28(1) 	Store old fp in ghost frame 
178:    LDA  1,-28(1) 	Load address of new frame 
179:    LDA  3,1(7) 	Return address in ac 
180:    LDA  7,-151(7) 	call outnl
181:    LDA  3,0(2) 	Save the result in ac 
* 30
182:    LDC  3,5(6) 	Load constant 
183:     ST  3,-28(1) 	Save index in temp 
184:    LDC  3,4(6) 	Load constant 
185:    LDA  4,-10(1) 	Load address of base of array y
186:    SUB  3,4,3 	Compute offset of value 
187:     LD  3,0(3) 	Load the value 
188:     LD  4,-28(1) 	load index from temp to ac1 
189:    LDA  5,-2(1) 	Load address of base of array x
190:    SUB  5,5,4 	Compute offset of value 
191:     ST  3,0(5) 	Store variable x
* 31
192:     ST  1,-28(1) 	Store old fp in ghost frame 
193:    LDC  3,5(6) 	Load constant 
194:    LDA  4,-2(1) 	Load address of base of array x
195:    SUB  3,4,3 	Compute offset of value 
196:     LD  3,0(3) 	Load the value 
197:     ST  3,-30(1) 	Store parameter 
198:    LDA  1,-28(1) 	Load address of new frame 
199:    LDA  3,1(7) 	Return address in ac 
200:    LDA  7,-190(7) 	call output
201:    LDA  3,0(2) 	Save the result in ac 
* 32
202:    LDC  3,3(6) 	Load constant 
203:     ST  3,-28(1) 	Save index in temp 
204:    LDC  3,2(6) 	Load constant 
205:    LDA  4,-23(1) 	Load address of base of array b
206:    SUB  3,4,3 	Compute offset of value 
207:     LD  3,0(3) 	Load the value 
208:     LD  4,-28(1) 	load index from temp to ac1 
209:    LDA  5,-17(1) 	Load address of base of array a
210:    SUB  5,5,4 	Compute offset of value 
211:     ST  3,0(5) 	Store variable a
* 33
212:     ST  1,-28(1) 	Store old fp in ghost frame 
213:    LDC  3,3(6) 	Load constant 
214:    LDA  4,-17(1) 	Load address of base of array a
215:    SUB  3,4,3 	Compute offset of value 
216:     LD  3,0(3) 	Load the value 
217:     ST  3,-30(1) 	Store parameter 
218:    LDA  1,-28(1) 	Load address of new frame 
219:    LDA  3,1(7) 	Return address in ac 
220:    LDA  7,-198(7) 	call outputb
221:    LDA  3,0(2) 	Save the result in ac 
* 34
222:     ST  1,-28(1) 	Store old fp in ghost frame 
223:    LDA  1,-28(1) 	Load address of new frame 
224:    LDA  3,1(7) 	Return address in ac 
225:    LDA  7,-196(7) 	call outnl
226:    LDA  3,0(2) 	Save the result in ac 
* 36
227:    LDC  3,5(6) 	Load constant 
228:     ST  3,-28(1) 	Save index in temp 
229:    LDC  3,4(6) 	Load constant 
230:    LDA  4,-7(0) 	Load address of base of array gy
231:    SUB  3,4,3 	Compute offset of value 
232:     LD  3,0(3) 	Load the value 
233:     LD  4,-28(1) 	load index from temp to ac1 
234:    LDA  5,0(0) 	Load address of base of array gx
235:    SUB  5,5,4 	Compute offset of value 
236:     ST  3,0(5) 	Store variable gx
* 37
237:     ST  1,-28(1) 	Store old fp in ghost frame 
238:    LDC  3,5(6) 	Load constant 
239:    LDA  4,0(0) 	Load address of base of array gx
240:    SUB  3,4,3 	Compute offset of value 
241:     LD  3,0(3) 	Load the value 
242:     ST  3,-30(1) 	Store parameter 
243:    LDA  1,-28(1) 	Load address of new frame 
244:    LDA  3,1(7) 	Return address in ac 
245:    LDA  7,-235(7) 	call output
246:    LDA  3,0(2) 	Save the result in ac 
* 38
247:    LDC  3,3(6) 	Load constant 
248:     ST  3,-28(1) 	Save index in temp 
249:    LDC  3,2(6) 	Load constant 
250:    LDA  4,-18(0) 	Load address of base of array gb
251:    SUB  3,4,3 	Compute offset of value 
252:     LD  3,0(3) 	Load the value 
253:     LD  4,-28(1) 	load index from temp to ac1 
254:    LDA  5,-13(0) 	Load address of base of array ga
255:    SUB  5,5,4 	Compute offset of value 
256:     ST  3,0(5) 	Store variable ga
* 39
257:     ST  1,-28(1) 	Store old fp in ghost frame 
258:    LDC  3,3(6) 	Load constant 
259:    LDA  4,-13(0) 	Load address of base of array ga
260:    SUB  3,4,3 	Compute offset of value 
261:     LD  3,0(3) 	Load the value 
262:     ST  3,-30(1) 	Store parameter 
263:    LDA  1,-28(1) 	Load address of new frame 
264:    LDA  3,1(7) 	Return address in ac 
265:    LDA  7,-243(7) 	call outputb
266:    LDA  3,0(2) 	Save the result in ac 
* 40
267:     ST  1,-28(1) 	Store old fp in ghost frame 
268:    LDA  1,-28(1) 	Load address of new frame 
269:    LDA  3,1(7) 	Return address in ac 
270:    LDA  7,-241(7) 	call outnl
271:    LDA  3,0(2) 	Save the result in ac 
* RETURN
272:    LDA  2,0(3) 	Copy result to rt register 
273:     LD  3,-1(1) 	Load return address 
274:     LD  1,0(1) 	Adjust fp 
275:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
276:    LDC  2,0(6) 	Set return value to 0 
277:     LD  3,-1(1) 	Load return address 
278:     LD  1,0(1) 	Adjust fp 
279:    LDA  7,0(3) 	Return 
* END of function main
