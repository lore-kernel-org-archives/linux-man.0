From: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] getrandom.2, random.4: Consolidate and improve
 discussion on usage of randomness
Date: Fri, 11 Nov 2016 08:41:39 +0100
Message-ID: <1478850099.2484.7.camel@redhat.com>
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA@mail.gmail.com>
         <55B65DAC.6010906@lgeorget.eu>
         <2fc34759-5d2b-4192-9611-b499e23efdf8@gmail.com>
         <1478767372.2642.15.camel@redhat.com>
         <fa60e32a-1364-d0be-245f-d8ead6d04713@gmail.com>
         <1478788558.3579.47.camel@redhat.com>
         <66494ef9-80d1-e437-252a-4a15e1f497db@lgeorget.eu>
         <02c2fa67-ce72-010b-e1ac-ae52c1bc6cf2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <02c2fa67-ce72-010b-e1ac-ae52c1bc6cf2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, Carl =?ISO-8859-1?Q?Winb=E4ck?= <c@tunnel53.net>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org, ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org, luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org, on2014nm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, 2016-11-10 at 19:16 +0100, Michael Kerrisk (man-pages) wrote:
> Nikos, Laurent,
> So, I must admit that after your respective mails, I'm still not
> clear. Do you think I should keep this patch, change it, or
> discard it?

It is a bit confusing to me. The sentences:
"When  reading  from  /dev/urandom  (GRND_RANDOM  is  not set),
getrandom()"

and

"The behavior when a call to getrandom() that is
blocked  while  reading  from  /dev/urandom"

seem to imply that getrandom() is a wrapper over /dev/urandom (i.e.,
internally it opens the device reads etc). That's not the case the
system call doesn't go through /dev/urandom, although the pools behind
are the same.

maybe saying the /dev/urandom pool instead, but I find that even that
could confuse someone.

So while the text is better and more precise in other aspects than
before I think it is a bit confusing the mix of getrandom() with
/dev/urandom and /dev/random. Maybe copy the text back and separate the
descriptions even if they are very similar at the moment? 

regards,
Nikos

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
