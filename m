From: Petr Tesarik <ptesarik-AlSwsSmVLrQ@public.gmane.org>
Subject: Fix formatting of compact ASCII tables in PostScript output
Date: Tue, 14 Dec 2010 10:41:09 +0100
Message-ID: <1292319669.4465.3.camel@nathan.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

the compact tables are made using the .nf directive, which is fine for
devices that use only fixed-width fonts, but totally broken e.g. for
output to PostScript. tbl(1) macros should be used to produce the
tables. Patch against latest git attached.

Petr Tesarik
SUSE Linux

diff --git a/man7/ascii.7 b/man7/ascii.7
index e5b4ee1..2db6772 100644
--- a/man7/ascii.7
+++ b/man7/ascii.7
@@ -124,33 +124,27 @@ _
 .SS Tables
 For convenience, let us give more compact tables in hex and decimal.
 .sp
-.nf
-.if t \{\
-.in 1i
-.ft CW
-\}
-   2 3 4 5 6 7       30 40 50 60 70 80 90 100 110 120
- -------------      ---------------------------------
-0:   0 @ P \` p     0:    (  2  <  F  P  Z  d   n   x
-1: ! 1 A Q a q     1:    )  3  =  G  Q  [  e   o   y
-2: " 2 B R b r     2:    *  4  >  H  R  \e  f   p   z
-3: # 3 C S c s     3: !  +  5  ?  I  S  ]  g   q   {
-4: $ 4 D T d t     4: "  ,  6  @  J  T  ^  h   r   |
-5: % 5 E U e u     5: #  \-  7  A  K  U  _  i   s   }
-6: & 6 F V f v     6: $  .  8  B  L  V  \`  j   t   ~
-7: \' 7 G W g w     7: %  /  9  C  M  W  a  k   u  DEL
-8: ( 8 H X h x     8: &  0  :  D  N  X  b  l   v
-9: ) 9 I Y i y     9: \'  1  ;  E  O  Y  c  m   w
-A: * : J Z j z
-B: + ; K [ k {
-C: , < L \e l |
-D: \- = M ] m }
-E: . > N ^ n ~
-F: / ? O _ o DEL
-.if t \{\
-.in
-.ft P
-\}
+.TS
+r1 c1 c1 c1 c1 c1 l0 c2 r1 c1 c1 c1 c1 c1 c1 c1 c1 c1 c.
+	2	3	4	5	6	7			30	40	50	60	70	80	90	100	110	120
+	_	_	_	_	_	_			_	_	_	_	_	_	_	_	_	_
+0:	 	0	@	P	\`	p		0:	 	(	2	<	F	P	Z	d	n	x
+1:	!	1	A	Q	a	q		1:	 	)	3	\&=	G	Q	[	e	o	y
+2:	"	2	B	R	b	r		2:	 	*	4	>	H	R	\e	f	p	z
+3:	#	3	C	S	c	s		3:	!	+	5	?	I	S	]	g	q	{
+4:	$	4	D	T	d	t		4:	"	,	6	@	J	T	^	h	r	|
+5:	%	5	E	U	e	u		5:	#	\-	7	A	K	U	\&_	i	s	}
+6:	&	6	F	V	f	v		6:	$	.	8	B	L	V	\`	j	t	~
+7:	\'	7	G	W	g	w		7:	%	/	9	C	M	W	a	k	u	DEL
+8:	(	8	H	X	h	x		8:	&	0	:	D	N	X	b	l	v
+9:	)	9	I	Y	i	y		9:	\'	1	;	E	O	Y	c	m	w
+A:	*	:	J	Z	j	z
+B:	+	;	K	[	k	{
+C:	,	<	L	\e	l	|
+D:	\-	\&=	M	]	m	}
+E:	.	>	N	^	n	~
+F:	/	?	O	\&_	o	DEL
+.TE
 .fi
 .SH NOTES
 .SS History


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
