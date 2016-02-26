From: Martin Gebert <Murphy.Gebert-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: backtrace(3): Inconsistency and missing indentation
Date: Fri, 26 Feb 2016 22:08:13 +0100
Message-ID: <56D0BEBD.50908@gmx.de>
References: <56CD772C.8030606@gmx.de> <56D07349.10901@gmail.com>
 <CAAHpriNbkVCsH-mrVi97Y57ahw=6yO=kh+C7OuLzfQXrJiJO-Q@mail.gmail.com>
 <56D0B704.8050001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D0B704.8050001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Keith Thompson <keithsthompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Keith Thompson <Keith.S.Thompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Keith!

> I suggest leaving it as it was, apart from using SIZE in the definition > of buffer. > > It's common for preprocessor directives to be
left-justified rather > than aligned with the surrounding code.  (They
mostly appear at file > scope, so it's not usually an issue.)  It's
perfectly valid to indent > the #define, but it's a bit misleading,
since it implies that SIZE has > a scope (it doesn't, it's visible to
the end of the translation unit).

While I agree with you concerning the scope, I would then expect the
SIZE macro be placed between the includes and the function header, as
everything that has not a block scope. It just seems misplaced in the
middle of the function (more exactly between the variable definitions),
but outdented.
More generally, if somebody wants to make clear that a macro has only
meaning in the local block I would prefer to place it there, but indent
it with the rest of the code. If it's supposed to be used file-wide I
would expect it before the first function, but without indention. IMHO
the given code snippet is a wild mix that caught my eye as being quite
unpleasing and unintuitive. So I suggest doing it the one /or/ the other
way; I would've preferred Michael's solution in the first place, but
obviously that's not universal enough for a man page.
And as a disclaimer, that's my built-in, intuitive style guide speaking,
as I'm by no means an authority of C code formatting.

Cheers,

Martin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
