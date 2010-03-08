From: Joern Heissler <contact-pbvhy9/vjlfAiHgwPnP32rNAH6kLmebB@public.gmane.org>
Subject: %n in fscanf
Date: Mon, 08 Mar 2010 12:38:48 +0100
Message-ID: <4B94E1C8.8010100@joern.heissler.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The fscanf manpage contains this:

n      Nothing  is  expected;  instead, the number of characters consum=
ed thus far from the input is=20
stored through the next pointer, which must be a pointer to int.  This =
is not a conversion, although it=20
can be suppressed with the * assignment-suppression character.  The  C =
 standard  says:
"Execution  of  a  %n  directive does not increment the assignment coun=
t returned at the completion of=20
execution" but the Corrigendum seems to contradict this.  Probably it i=
s wise not to make any=20
assumptions on the effect of %n conversions on the return value.


I wondered about this and looked at c89, c99+tc3, c1x, k&r2, posix manp=
ages; all say that %n does *not*=20
increase the counter. %*n causes undefined behaviour according to c99+t=
c3.
I wasn't able to find proof that any Corrigendum says otherwise.
Therefore I think it's safe to say that you can indeed make the assumpt=
ion that %n does not affect the=20
return value.

Suggested patch:
--- scanf.3.orig        2010-03-08 12:21:59.000000000 +0100
+++ scanf.3     2010-03-08 12:29:59.000000000 +0100
@@ -506,18 +506,15 @@
  .IR int .
  This is
  .I not
-a conversion, although it can be suppressed with the
-.B *
-assignment-suppression character.
-The C standard says: "Execution of a
-.B %n
-directive does not increment
-the assignment count returned at the completion of execution"
-but the Corrigendum seems to contradict this.
-Probably it is wise
-not to make any assumptions on the effect of
-.B %n
-conversions on the return value.
+a conversion and does
+.I not
+increase the count returned by the function.
+The assignment can be suppressed with the
+.B *
+assignment-suppression character, but the effect on the
+return value is undefined. Therefore
+.B %*n
+conversions should not be used.
  .SH "RETURN VALUE"
  These functions return the number of input items
  successfully matched and assigned,


Cheers,
J=F6rn Heissler
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
