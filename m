From: Georg Sauthoff <mail-vzQcyvifq/Y@public.gmane.org>
Subject: Re: strtok - strings without delimiters
Date: Sat, 1 Jun 2013 22:58:54 +0200
Message-ID: <20130601205854.GP21458@x220.fritz.box>
References: <20130512202212.GL21458@x220.fritz.box>
 <51993A39.3060606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51993A39.3060606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, May 19, 2013 at 10:46:49PM +0200, Michael Kerrisk wrote:

Hi,

> On 05/12/13 22:22, Georg Sauthoff wrote:
> > the strtok man-page does not specify what happens if `str` does not
> > contain any `delim`iters.

> > If you don't already know strtok one might assume then either:

> > - the delimiter-less string is considered the next token and thus
> >   returned upon the first call to strtok
> > - on the first call NULL is returned because there are not any toke=
ns

> > Related issue: is the non-empty `str`-suffix after the last `delim`
> > returned as a token or not?
=20
> Thanks for the report, though I must say that it would have been a=20
> little more helpful if you had answered the rhetorical questions you=20
> ask... (It would have aided me as I reminded myself of the details.)

oh, sorry, you are right.

> > I know how strtok works -=20
>
> In which case a patch would have made the bug report even better stil=
l!

Ok, next time.

> > but perhaps it makes sense to explicitly
> > address these issues in the Linux man page.
=20
> Anyway, I agree that the page could be clearer. I've added the follow=
ing text:
=20
>        A sequence of calls to strtok() that operate on the same strin=
g
>        maintains  a  pointer  that  determines the point from which t=
o
>        start searching for the next token.  The first call to strtok(=
)
>        sets  this  pointer  to  point to the first byte of the string=
=2E

>        The start of the next token is determined by  scanning  forwar=
d
>        for  the  next  nondelimiter  byte  in  str.  If such a byte i=
s
>        found, it is taken as the start of the next token.  If no  suc=
h
>        byte  is  found,  then  there  are no more tokens, and strtok(=
)
>        returns NULL.  (A string that is empty or  that  contains  onl=
y
>        delimiter  will thus cause strtok() to return NULL on the firs=
t

plural, delimiters?

>        call.)
>=20
>        The end of each token is found by scanning forward until eithe=
r
>        the  next delimiter byte is found or until the terminating nul=
l
>        byte ('\0') is encountered.  If a delimiter byte is  found,  i=
t
>        is overwritten with a null byte to terminate the current token=
,
>        and strtok() saves  a  pointer  to  the  following  byte;  tha=
t
>        pointer  will  be used as the starting point when searching fo=
r
>        the next token.  In this case, strtok() returns  a  pointer  t=
o
>        the start of the found token.

>        From  the above description, it follows thatt a sequence of tw=
o

typo: /thatt/that/

>        or more contiguous delimiter bytes in the parsed string is con=
=E2=80=90
>        sidered  to  be a single delimiter, and that delimiter bytes a=
t
>        the start or end of the string are ignored.  Put  another  way=
:
>        the  tokens  returned  by strtok() are always nonempty strings=
=2E
>        Thus, for example, given  the  string  "aaa;;bbb,",  successiv=
e
>        calls  to strtok() that specify the delimiter string ";," woul=
d
>        return the strings "aaa" and "bbb", and then a NULL pointer.
=20
> Sufficient?

Yes!

Best regards
Georg
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
