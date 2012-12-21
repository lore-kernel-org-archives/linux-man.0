From: Cyrill Gorcunov <gorcunov@openvz.org>
Subject: Re: [PATCH 1/2] Add kcmp.2 manpage
Date: Fri, 21 Dec 2012 22:34:00 +0400
Message-ID: <20121221183400.GL32442@moon>
References: <1342995307-884-1-git-send-email-gorcunov@openvz.org>
 <1342995307-884-2-git-send-email-gorcunov@openvz.org>
 <CAKgNAkj-=wLEM+SjA_S8GUp0+0o5R4NuDH4fL-8H-pKCKdLryA@mail.gmail.com>
 <20121218170624.GA7148@moon>
 <20121218171217.GD7155@moon>
 <CAKgNAkg536wfJy6WjjLANamchZg0XQ3sAHtCtvPtgCkTu_hHMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkg536wfJy6WjjLANamchZg0XQ3sAHtCtvPtgCkTu_hHMw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, "H. Peter Anvin" <hpa@zytor.com>, Pavel Emelyanov <xemul@parallels.com>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-man@vger.kernel.org

On Fri, Dec 21, 2012 at 07:24:27PM +0100, Michael Kerrisk (man-pages) wrote:
> On Tue, Dec 18, 2012 at 6:12 PM, Cyrill Gorcunov <gorcunov@openvz.org> wrote:
> > On Tue, Dec 18, 2012 at 09:06:24PM +0400, Cyrill Gorcunov wrote:
> >> On Tue, Dec 18, 2012 at 05:54:49PM +0100, Michael Kerrisk (man-pages) wrote:
> >> > Hello Cyrill,
> >> >
> >> > On Mon, Jul 23, 2012 at 12:15 AM, Cyrill Gorcunov <gorcunov@openvz.org> wrote:
> >> > > NAME
> >> > >        kcmp - compare if two processes do share a particular kernel resource
> >> >
> >> > Very late follow up on this page, sorry. You didn't provide a
> >> > copyright or license for this page. Could you please supply that
> >> > information. See http://www.kernel.org/doc/man-pages/licenses.html .
> >>
> >> Sure, gimme some time to update it...
> >
> > Something like below?
> 
> Yep, that's fine. I've done some substantial editing and added several
> pieces to the page.  Could you take a careful look at the version to
> see that I have not injected any inaccuracies?

Looks good to me, thanks! (There is some work initiated to make this
syscall available for all archs so this page will need to be updated
more-less soon, but it's my problems, i'll send you update once transition
complete).

	Cyrill
