From: Keith Thompson <keithsthompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Proposed change to str*.3 man pages
Date: Tue, 16 Feb 2016 14:52:07 -0800
Message-ID: <CAAHpriNWwEnK0ciFnhUMR+N0SpyGBss7nQmxBE11R7Q9GJA7GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Keith Thompson <Keith.S.Thompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

A number of man pages refer to char* arguments as "strings" rather than as
"pointers to strings".

For example, here's an excerpt from man3/strcmp.3:

    The strcmp() function compares the two strings s1 and s2. It returns
    an integer less than, equal to, or greater than zero if s1 is found,
    respectively, to be less than, to match, or be greater than s2.

Compare the wording in the ISO C standard:

    The strcmp function compares the string pointed to by s1 to the string
    pointed to by s2.
    ...
    The strcmp function returns an integer greater than, equal to,
    or less than zero, accordingly as the string pointed to by s1 is
    greater than, equal to, or less than the string pointed to by s2.

The Solaris strcmp(3) man page also correctly refers to the arguments
as pointers to strings.

There is a widespread misconception that a char* pointer value
is itself a string, rather than a pointer to a string. See the
definitions in the C standard draft, N1570 7.1.1 paragraph 1,
http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf :

    A *string* is a contiguous sequence of characters terminated by and
    including the first null character. [...] A *pointer to a string*
    is a pointer to its initial (lowest addressed) character.

I haven't checked, but it's likely that there are man pages other than
the str*.3 pages that have this problem. However, I note that man3/fopen.3
correctly refers to "the string pointed to by path".

I'd like to volunteer to produce a patch that correctly refers to these
pointers as pointers rather than as strings -- but it would take a
while, and I don't want to spend the time if the patch is unlikely to
be accepted.

What say you?

-- 
Keith Thompson <Keith.S.Thompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
