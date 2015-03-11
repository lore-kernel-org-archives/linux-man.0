From: Alexei Starovoitov <ast@plumgrid.com>
Subject: Re: [PATCH man-pages] bpf.2: new page documenting bpf(2)
Date: Tue, 10 Mar 2015 20:59:10 -0700
Message-ID: <CAMEtUuw1WjYU_jVHw+M5Lng7nEZSHBQb8tSGQC0FTf_RUzJFyw@mail.gmail.com>
References: <1425939036-30044-1-git-send-email-ast@plumgrid.com> <CAKvUva8a2vZ9racK0BTaAk5K7UROoW-hSbc_bgBAQtbQjQdXvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKvUva8a2vZ9racK0BTaAk5K7UROoW-hSbc_bgBAQtbQjQdXvg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Silvan Jegen <s.jegen@gmail.com>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Tue, Mar 10, 2015 at 6:16 AM, Silvan Jegen <s.jegen@gmail.com> wrote:
> Hi Alexei
>
> Please find some comments and suggestions below.

Thanks a lot for review!
I think I've addressed all comments:
 man2/bpf.2 |  187 ++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 100 insertions(+), 87 deletions(-)
:)

the only thing I didn't change is 's/C/C dialect/ (?)'
Because the word 'dialect' would mean that there are
differences beyond reduced expressions.
It's a normal C. Compiler doesn't allow certain C constructs.
Like it's not possible to have global variables, loops, vararg
functions, passing structures, etc.

I'll add a license and will resend.

Thanks!
