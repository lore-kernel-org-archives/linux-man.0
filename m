From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 2/2] exec: increase BINPRM_BUF_SIZE to 256
Date: Fri, 16 Nov 2018 17:49:11 +0000
Message-ID: <20181116174911.6fcff580@alans-desktop>
References: <20181112160931.GA28463@redhat.com>
        <20181112160956.GA28472@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181112160956.GA28472@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ben Woodard <woodard@redhat.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Mon, 12 Nov 2018 17:09:56 +0100
Oleg Nesterov <oleg@redhat.com> wrote:

> Large enterprise clients often times run applications out of networked
> file systems where the IT mandated layout of project volumes can end up
> leading to paths that are longer than 128 characters. Bumping this up to
> the next order of two solves this problem in all but the most egregious
> case while still fitting into a 512b slab.

You also need to update the execve manual page as it explicitly documents
the 128 byte limit.

Alan
