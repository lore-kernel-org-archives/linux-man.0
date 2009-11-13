From: Martin Gebert <martin.gebert-TAFHyoIWub4hFhg+JK9F0w@public.gmane.org>
Subject: man stdint.h
Date: Fri, 13 Nov 2009 11:02:42 +0100
Message-ID: <4AFD2EC2.60000@alpha-bit.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

I just found this ambiguities in stdint.h(0p) (from package
man-pages-posix-2003a on a current Gentoo system):

"An N-bit signed type has values in the range -2**N-1 or 1-2**N-1 to
2**N-1-1, while an N-bit unsigned type has values in the
range 0 to 2**N-1."

IMHO this should be "to (2**N-1)-1" for signed ints, and "to (2**N)-1"
for unsigned. Yet I'm not sure about the precedence of the ** operator,
as it is not defined for C/C++, so some more parenthesis around the
exponents should make this clear.

Martin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
