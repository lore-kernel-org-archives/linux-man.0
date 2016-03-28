From: =?iso-8859-1?Q?J=F6rn?= Engel <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>
Subject: Re: open(2) manpage and O_NONBLOCK
Date: Sun, 27 Mar 2016 22:04:50 -0700
Message-ID: <20160328050450.GA27411@cork>
References: <20160321202347.GG1612@cork>
 <CAKgNAkiLsw5c_Q+EknRijgeJGNvQ_R6HxdgA=YhBgcXsbv+mpQ@mail.gmail.com>
 <20160328040845.GT17997@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160328040845.GT17997-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Mar 28, 2016 at 05:08:45AM +0100, Al Viro wrote:
> On Mon, Mar 28, 2016 at 04:58:33PM +1300, Michael Kerrisk (man-pages)=
 wrote:
> > > blocking memory allocation:
> > >         f =3D kmem_cache_zalloc(filp_cachep, GFP_KERNEL);
> >=20
> > For how long might this block, though?
>=20
> Not much, usually.  Finding the file, though, can bloody well take a =
_long_
> time - put it behind an automount from a slow server and we might be =
easily
> talking about minutes, if not longer.

Another example that bit me in the past is scsi devices checking for
media presence.  If any part of your storage stack drops the cdb, you
have to wait for a scsi timeout, usually 30s.

Disk events commonly cause delays around the half-second mark.  I
haven't gone through the code yet to see what the actual limits are.
Half a second might already be too long for some realtime
applications.

J=F6rn

--
When I am working on a problem I never think about beauty.  I think
only how to solve the problem.  But when I have finished, if the
solution is not beautiful, I know it is wrong.
-- R. Buckminster Fuller
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
