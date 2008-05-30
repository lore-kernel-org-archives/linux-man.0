From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Fri, 30 May 2008 13:17:22 -0700
Message-ID: <20080530131722.07f9723b.akpm@linux-foundation.org>
References: <482D4665.4050401@gmail.com>
	<E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu>
	<48401E7E.9090304@gmail.com>
	<E1K27bZ-0002Gk-3b@pomaz-ex.szeredi.hu>
	<cfd18e0f0805301124o5f217dden10726b268d05d81a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755828AbYE3USm@vger.kernel.org>
In-Reply-To: <cfd18e0f0805301124o5f217dden10726b268d05d81a@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Kerrisk <mtk.manpages@googlemail.com>
Cc: miklos@szeredi.hu, drepper@redhat.com, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Fri, 30 May 2008 20:24:22 +0200
"Michael Kerrisk" <mtk.manpages@googlemail.com> wrote:

> > After we fixed the original issue, we can still think about this other
> > thing :)
> 
> Okay, by now quite a bit of my time has been wasted, and my patience
> is starting to get a little thin.

Well yeah.  This has been dragging on for ages.  I was going to just
apply this patch and stomp off again but this:

  "against 2.6.26rc2, with the 2008-05-19 git changes you sent me
   applied"

stymied me.

Please, if poss, just send a standalone, fully-changelogged,
not-referential-to-some-random-email-discussion patch and let's get
going.

(Where's Ulrich, btw?)
