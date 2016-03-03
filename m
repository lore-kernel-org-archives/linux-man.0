From: Joseph Myers <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Thu, 3 Mar 2016 22:39:22 +0000
Message-ID: <alpine.DEB.2.10.1603032238140.20393@digraph.polyomino.org.uk>
References: <51B0B39F.4060202@redhat.com> <51B0BD36.3030202@redhat.com> <CAHGf_=r9Rz63pho+84ORk0a_oDyJSj-MCnZ56uPrT3L6sVEfeQ@mail.gmail.com> <20130607013024.GO29800@brightrain.aerifal.cx> <51B19203.3070307@redhat.com> <20130607144143.GQ29800@brightrain.aerifal.cx>
 <51B57E35.4080403@redhat.com> <51B65EA7.2020402@redhat.com> <20130611011324.GT29800@brightrain.aerifal.cx> <51B8702D.2060505@redhat.com> <20130813040038.GE21795@spoyarek.pnq.redhat.com> <520C88A6.9070501@redhat.com> <56D54DAD.1040306@gmail.com>
 <56D5CA79.9030204@redhat.com> <56D5F832.3070209@gmail.com> <56D5FB3D.5000306@redhat.com> <56D607BB.6080701@cs.ucla.edu> <56D614AA.7020500@redhat.com> <56D61A86.3050108@cs.ucla.edu> <56D620AA.40108@redhat.com> <56D624FE.1090702@cs.ucla.edu> <56D6294A.5040703@redhat.com>
 <56D72683.6010302@cs.ucla.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D72683.6010302-764C0pRuGfqVc3sceRu5cw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Eggert <eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>
Cc: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 2 Mar 2016, Paul Eggert wrote:

> analyzers that the array in question may be larger. It also adds a
> compile-time option (default off) to simply use flexible arrays without the
> backwards-compatibility hack. We could use that option in Gnulib.

I don't think such a compile-time option is desirable (especially not 
undocumented, all feature test macros should be documented in 
creature.texi); we shouldn't profilerate feature-test macros for things 
that aren't well-defined API groups.

-- 
Joseph S. Myers
joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
