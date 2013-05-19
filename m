From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: strtok - strings without delimiters
Date: Sun, 19 May 2013 22:46:49 +0200
Message-ID: <51993A39.3060606@gmail.com>
References: <20130512202212.GL21458@x220.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130512202212.GL21458-w6h1d7rV6+VwFLYp8hBm2A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georg Sauthoff <mail-vzQcyvifq/Y@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Georg,

On 05/12/13 22:22, Georg Sauthoff wrote:
> Hi,
>=20
> the strtok man-page does not specify what happens if `str` does not
> contain any `delim`iters.
>=20
> If you don't already know strtok one might assume then either:
>=20
> - the delimiter-less string is considered the next token and thus
>   returned upon the first call to strtok
> - on the first call NULL is returned because there are not any tokens
>=20
> Related issue: is the non-empty `str`-suffix after the last `delim`
> returned as a token or not?

Thanks for the report, though I must say that it would have been a=20
little more helpful if you had answered the rhetorical questions you=20
ask... (It would have aided me as I reminded myself of the details.)

> I know how strtok works -=20

In which case a patch would have made the bug report even better still!

> but perhaps it makes sense to explicitly
> address these issues in the Linux man page.

Anyway, I agree that the page could be clearer. I've added the followin=
g text:

       A sequence of calls to strtok() that operate on the same string
       maintains  a  pointer  that  determines the point from which to
       start searching for the next token.  The first call to strtok()
       sets  this  pointer  to  point to the first byte of the string.
       The start of the next token is determined by  scanning  forward
       for  the  next  nondelimiter  byte  in  str.  If such a byte is
       found, it is taken as the start of the next token.  If no  such
       byte  is  found,  then  there  are no more tokens, and strtok()
       returns NULL.  (A string that is empty or  that  contains  only
       delimiter  will thus cause strtok() to return NULL on the first
       call.)

       The end of each token is found by scanning forward until either
       the  next delimiter byte is found or until the terminating null
       byte ('\0') is encountered.  If a delimiter byte is  found,  it
       is overwritten with a null byte to terminate the current token,
       and strtok() saves  a  pointer  to  the  following  byte;  that
       pointer  will  be used as the starting point when searching for
       the next token.  In this case, strtok() returns  a  pointer  to
       the start of the found token.

       From  the above description, it follows thatt a sequence of two
       or more contiguous delimiter bytes in the parsed string is con=E2=
=80=90
       sidered  to  be a single delimiter, and that delimiter bytes at
       the start or end of the string are ignored.  Put  another  way:
       the  tokens  returned  by strtok() are always nonempty strings.
       Thus, for example, given  the  string  "aaa;;bbb,",  successive
       calls  to strtok() that specify the delimiter string ";," would
       return the strings "aaa" and "bbb", and then a NULL pointer.

Sufficient?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
