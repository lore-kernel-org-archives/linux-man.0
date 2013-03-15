From: Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: wfix
Date: Fri, 15 Mar 2013 01:29:00 +0100
Message-ID: <201303150129.00866.vda.linux@googlemail.com>
References: <1362191753-6287-1-git-send-email-taffit@debian.org> <1362192041-7538-1-git-send-email-taffit@debian.org> <CAKgNAkicPqZdj0UR1UuXo1+X-Ddw3yzZZmorF+W3SYQA4G1H9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkicPqZdj0UR1UuXo1+X-Ddw3yzZZmorF+W3SYQA4G1H9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: David =?iso-8859-1?q?Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tuesday 05 March 2013 17:39, Michael Kerrisk (man-pages) wrote:
> [CC+=3DDenys]
>=20
> On Sat, Mar 2, 2013 at 3:40 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> > ---
> >  man2/ptrace.2 |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/man2/ptrace.2 b/man2/ptrace.2
> > index 9d1133c..a685049 100644
> > --- a/man2/ptrace.2
> > +++ b/man2/ptrace.2
> > @@ -214,7 +214,7 @@ some modifications to the USER area are disallo=
wed.
> >  .TP
> >  .BR PTRACE_GETREGS ", " PTRACE_GETFPREGS
> >  Read the tracee's general-purpose or floating-point registers,
> > -respectively, to the address
> > +respectively, at the address
> >  .I data
> >  in the tracer.
> >  See
>=20
> David, I think you are right that there is a wording problem in this
> sentence -- "Read ... to" is not the right preposition .  But I think
> the fix is to change "Read" to "Copy". Thus:
>=20
> .TP
> .BR PTRACE_GETREGS ", " PTRACE_GETFPREGS
> - Read the tracee's general-purpose or floating-point registers,
> + Copy the tracee's general-purpose or floating-point registers,
> respectively, to the address
> .I data
> in the tracer.

Sounds ok.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
