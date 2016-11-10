From: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] getrandom.2, random.4: Consolidate and improve
 discussion on usage of randomness
Date: Thu, 10 Nov 2016 15:35:58 +0100
Message-ID: <1478788558.3579.47.camel@redhat.com>
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA@mail.gmail.com>
         <55B65DAC.6010906@lgeorget.eu>
         <2fc34759-5d2b-4192-9611-b499e23efdf8@gmail.com>
         <1478767372.2642.15.camel@redhat.com>
         <fa60e32a-1364-d0be-245f-d8ead6d04713@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fa60e32a-1364-d0be-245f-d8ead6d04713-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, Carl =?ISO-8859-1?Q?Winb=E4ck?= <c@tunnel53.net>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org, ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org, luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org, on2014nm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, 2016-11-10 at 15:23 +0100, Michael Kerrisk (man-pages) wrote:
> [was: Re: Status for bug 71211? [random(4): clarify utility and
> volume]]
> 
> Hello Nikos,
> 
> On 11/10/2016 09:42 AM, Nikos Mavrogiannopoulos wrote:
> > 
> > On Wed, 2016-11-09 at 16:27 +0100, Michael Kerrisk (man-pages)
> > wrote:
> > > 
> > > Nikos,
> > > 
> > > This was an earlier mail from Laurent Georget. I bring
> > > you into this thread in case there's any of Laurent's comments
> > > that may be helpful as inspiration for your patch.
> > > 
> > > See also https://bugzilla.kernel.org/show_bug.cgi?id=71211
> > 
> > I think that's a nice comment. The text referred to applies to old
> > kernels not new ones (especially not after the recent rewrite), and
> > I
> > think it documents and opinion rather than a fact. I am inclined to
> > simply drop the referred paragraph. Any better suggestions?
> 
> Dropping the paragraph appears too strong too me. Surely we want 
> to maintain a recommendation not to consume too much data from
> /dev/urandom?

Stephan Mueller or Ted should be able to provide more info for the new
code. I think in the new versions of /dev/urandom the amount consumed
shouldn't cause issues or affect other users.

However, I agree that overall, that this is a low level interface and
it should be treated as such. I.e., I'd expect applications to use
their crypto libraries' interfaces rather than getrandom directly. The
reason is not only about being slow, but about having to take care
about EINTR, short reads, quirks such as for early boot, etc [0]. 

regards,
Nikos

[0]. I've tried to write down some argumentation at:
http://nmav.gnutls.org/2016/10/random-generator-linux.html

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
