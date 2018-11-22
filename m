From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH 2/2] exec: increase BINPRM_BUF_SIZE to 256
Date: Thu, 22 Nov 2018 13:15:22 +0100
Message-ID: <20181122121521.GB28270@redhat.com>
References: <20181112160931.GA28463@redhat.com>
 <20181112160956.GA28472@redhat.com>
 <20181116174911.6fcff580@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116174911.6fcff580@alans-desktop>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ben Woodard <woodard@redhat.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 11/16, Alan Cox wrote:
>
> On Mon, 12 Nov 2018 17:09:56 +0100
> Oleg Nesterov <oleg@redhat.com> wrote:
>
> > Large enterprise clients often times run applications out of networked
> > file systems where the IT mandated layout of project volumes can end up
> > leading to paths that are longer than 128 characters. Bumping this up to
> > the next order of two solves this problem in all but the most egregious
> > case while still fitting into a 512b slab.
>
> You also need to update the execve manual page as it explicitly documents
> the 128 byte limit.

Thanks, Eugene sent the patch:

	[PATCH] execve.2: document an effect of BINPRM_BUF_SIZE increase to 256
	https://marc.info/?l=linux-man&m=154281645706657

Oleg.
