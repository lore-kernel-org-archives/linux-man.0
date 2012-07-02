From: Nadav Har'El <nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org>
Subject: Missing info in atoi(3)
Date: Mon, 2 Jul 2012 21:52:59 +0300
Message-ID: <20120702185259.GA7753@fermat.math.technion.ac.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi, I found a peculiar behavior in atoi() which isn't explained in
atoi(3) - at least not in release 3.35 of the manual I have in Fedora 17.

atoi() returns an int, but I expected that I can do

	unsigned int i = atoi(...);

and it will just work fine, for any number - including numbers between
2^31 and 2^32. Any naive implementation of atoi(), repeatedly multiplying by
10 and adding the next digit, would have worked in this case just fine.
But unfortunately, glibc's atoi() actually does something different in
this case - for numbers >=2^31, it returns 2^31-1! The line above actually
returned the wrong result on half the unsigned integer range :( I tested this
on a 32-bit installation on Linux, by the way - I don't know if this makes
a difference.

I think it should be clearly state in atoi(3) what it does for numbers
larger than 2^31 (or however this limit is actually defined in the
code), and perhaps even explain why. I think it it should also be noted
that atoi() is therefore unsuitable for reading unsigned ints - and
for this purpose strtoul() should be preferred.

Finally, atoi(3) states that "[its] The behavior is the same as 
strtol(nptr, (char **) NULL, 10); except that atoi() does not detect errors."
In my test, this is NOT true - for numbers between 2^31 and 2^32 return
different things in both functions (the correct number in strtoul, or
2^31-1 for atoi), and neither returns an error.
	
-- 
Nadav Har'El                        |       Monday, Jul 2 2012, 13 Tammuz 5772
nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org             |-----------------------------------------
Phone +972-523-790466, ICQ 13349191 |Why aren't fishmongers generous? Their
http://nadav.harel.org.il           |business makes them selfish.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
