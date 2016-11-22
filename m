From: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Revised draft of random(7) man page for review
Date: Tue, 22 Nov 2016 11:20:45 +0100
Message-ID: <1479810045.31825.20.camel@redhat.com>
References: <50af97ae-e65e-30f3-c5ec-6f2129711f39@gmail.com>
         <20161115150407.jy7ix2i6dw5nyhbk@thunk.org>
         <1261638383.493623.1479591556767.JavaMail.zimbra@redhat.com>
         <49c33335-5933-e0bd-3e5e-d51ff051425f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49c33335-5933-e0bd-3e5e-d51ff051425f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Cc: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, Luke Bratch <luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org>, Ivan Babrou <ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas =?ISO-8859-1?Q?H=FChn?= <t@2uo.de>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, Carl =?ISO-8859-1?Q?Winb=E4ck?= <c@tunnel53.net>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, 2016-11-20 at 10:14 +0100, Michael Kerrisk (man-pages) wrote:
> Hello Nikos,

> > > 
> > > Obviously, no one knows of such a vulnerability, and I'm fairly
> > > confident that there won't be such a vulnerability across the
> > > different ways we've used to generate the urandom source --- but
> > > some
> > > people are professional paranoids, and would argue that we
> > > shouldn't
> > > make bulk output of the CSPRNG available for no good reason, just
> > > in
> > > case.
> > 
> > The above is certainly accurate, however, I think that such a
> > discussion or text, when reflected to a man-page is going to cause
> > problems. The audience of a man-page are not crypto people, and
> > seeing such text would create confusion rather than clarify how
> > these
> > devices/apis should be used. The *if* part is not put into a
> > perspective, suggesting that such an *if* is possible. However, if
> > one clarifies, i.e., in that case, your TLS or SSH connection is
> > most
> > likely broken as well, and not because of any attack on
> > /dev/urandom,
> > then one can see that we are heading towards a theoretical
> > discussion.
> > 
> > My suggestion, on that particular text would be to remove it, but
> > make it explicit somewhere in the text that all the assurances for
> > the devices depend on the crypto primitives, rather than describing
> > risks that may arise on particular usage patterns *if* primitives
> > are
> > broken.
> 
> Thanks. This makes sense to me. Following your suggestion, 
> I plan to apply the patch below. Does it seem okay to you?

Looks fine to me.

regards,
Nikos

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
