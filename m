From: David Howells <dhowells@redhat.com>
Subject: Re: Revised keyrings(7) man page for review
Date: Tue, 13 Dec 2016 13:31:26 +0000
Message-ID: <26757.1481635886@warthog.procyon.org.uk>
References: <9f32a79b-5795-bff4-b741-bf927a525149@gmail.com> <51643019-bb42-4066-c824-c55b9e668ac6@man7.org> <25262.1481628931@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f32a79b-5795-bff4-b741-bf927a525149@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: dhowells@redhat.com, Michael Kerrisk <mtk@man7.org>, lkml <linux-kernel@vger.kernel.org>, Eugene Syromyatnikov <evgsyr@gmail.com>, keyrings@vger.kernel.org, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) <mtk.manpages@gmail.com> wrote:

> I use/Linux man-pages uses the "Oxford comma" convention.

"... an optional comma ..." ;-)

There's also:

	... LSM security checks are still performed, and may filter out
        further keys that the process is not authorized to view.

but has two parts and isn't a list... ;-P

> >>                      D   The key is dead (i.e., has been deleted).  (A
> >>                          key  may  be  briefly  in  this  state during
> >>                          garbage collection.)
> > 
> > No - "dead" in this context means that the key type was unregistered.
> 
> Okay, so the text should read as:
> 
>                      D   The key is dead (i.e., the key has been unregis‐
>                          tered).  (A key may be  briefly  in  this  state
>                          during garbage collection.)
> 
> Right?

Not quite.  The driver for the key type has been unregistered, not the key.

David
