From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: grantpt and ptsname man pages
Date: Fri, 30 Sep 2011 18:39:54 +0200
Message-ID: <CAKgNAkif4C3KM8vjFXP22Qwe4sQ64jBQ1op_8eEonjtyzBoS_A@mail.gmail.com>
References: <20110930000307.GA10103@sergelap>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110930000307.GA10103@sergelap>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Serge E. Hallyn" <serge.hallyn-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Serge,

On Fri, Sep 30, 2011 at 2:03 AM, Serge E. Hallyn
<serge.hallyn-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> Hi,
>
> near as i can tell (from tests and code), ptsname and grantpt both
> require the passed-in fd to exist in /dev/pts. =A0So if you pass in
> an fd from a newinstance devpts mounted elsewhere things can go
> wrong. =A0Particularly if the passed-in fd is for /other/dev/pts/0
> and /dev/pts/0 does not exist, then grantpt and ptsname will return
> -ENOENT.
>
> The manpage should probably mention that. =A0I've not written anythin=
g
> for it yet. =A0(Willing to, but not until this weekend I'm afraid.)

That'd be great!

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
