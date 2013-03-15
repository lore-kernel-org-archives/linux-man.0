From: Serge Hallyn <serge.hallyn@ubuntu.com>
Subject: Re: For review: user_namespaces(7) man page
Date: Fri, 15 Mar 2013 10:38:11 -0500
Message-ID: <20130315153811.GD24305@sergelap>
References: <CAKgNAkh1TEkQiQ2g2jhbNzVTwpDYOreJt3rAukZCP9H1wh0mLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkh1TEkQiQ2g2jhbNzVTwpDYOreJt3rAukZCP9H1wh0mLQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-man <linux-man@vger.kernel.org>, Linux Containers <containers@lists.linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, Vasily Kulikov <segoon@openwall.com>
List-Id: linux-man@vger.kernel.org

Hi,

you mention that after creating a new user namespace you at first have
all capabilities in the new ns.  You don't explicitly mention (or I
missed it - I did see the mention of securebits) that if you want to
keep those capabilities after doing an exec, you need to first have
something mapped to uid 0 in the userns, and do setuid(0).

You might not want to list manpages from other projects, but Eric's
shadow patches introduce some good new manpages as well.  Those aren't yet
accepted upstream, but if/when they are then mention at least of
subuid(5), subgid(5), and newuidmap(1) and newgidmap(1) might be good.

thanks,
-serge
