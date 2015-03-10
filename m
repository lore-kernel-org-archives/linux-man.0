From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] intro.1: some improvements
Date: Tue, 10 Mar 2015 08:40:41 +0100
Message-ID: <20150310074041.GA1627@free.fr>
References: <54F6BBC0.4010401@gmail.com>
 <1425932797-16050-1-git-send-email-saulery@free.fr>
 <54FE8A86.9040405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FE8A86.9040405-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

Le mardi 10 mars 2015 =C3=A0 07:09:10, Michael Kerrisk (man-pages) a =C3=
=A9crit :
>=20
> I applied most of the patch, but...
>=20
> On 03/09/2015 09:26 PM, St=C3=A9phane Aulery wrote:
> > - Add a section Logout and poweroff and change login/logout by open=
/close session
>=20
> ... not this first piece. See comments below.
>=20
> > +.SS Logout and poweroff
> > +When you work is finished,
> > +you can press Control-D to close the current session.
> > +This does not turn off the machine.
> > +Only superusers have access to this command.
> > +If you are the single user you can also not log off
> > +and becoming a superuser by typing the command
> > +.BR su (1).
> > +Also you must type yours password.
> > +Finally enter the command "shutdown -P +1",
> > +which will turn off the computer after one minute.
> > +See
> > +.BR shutdown (8).
>=20
> I'm not sure that we really need most of the above piece. I mean, in =
these=20
> days of GUI and laptops. Most of us use the GUI or close the lid to=20
> shutdown/suspend.

I use startx / shutdown, so it does not shock me. This addition and the
other I have proposed that the reader knows what to do if X does not
start.

If you do not want, no problem, but now the page is incoherent:

- Control-D was moved to the non-added portion
- Su (1), shutdown (8) in excess in SEE ALSO

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
