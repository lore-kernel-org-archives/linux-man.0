From: Jann Horn <jannh@google.com>
Subject: Re: BPF: RCU use-after-reallocation of hash table elements?
Date: Wed, 3 Oct 2018 19:18:01 +0200
Message-ID: <CAG48ez1-WZH55+Wa2vgwZY_hpZJfnDxMzxGLtuN1hG1z6hKf5Q@mail.gmail.com>
References: <CAG48ez0Q3BaFsA_FUs1ZCAMRZtXkq5o_VCbU8CgTEVwa2HRZfQ@mail.gmail.com>
 <20181003170520.gc43zeffylshz5k2@ast-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181003170520.gc43zeffylshz5k2@ast-mbp.dhcp.thefacebook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Michael Kerrisk-manpages <mtk.manpages@gmail.com>, linux-man <linux-man@vger.kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Network Development <netdev@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Wed, Oct 3, 2018 at 7:05 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Wed, Oct 03, 2018 at 06:15:08PM +0200, Jann Horn wrote:
> > Hi!
> >
> > Note: I haven't tested any of this; feel free to tell me that I've
> > completely misunderstood how all this works.
> >
> > The BPF manpage, at the moment, states about BPF hash tables:
>
> unfortunately man pages have been obsolete for long time.
> the only doc that is mostly up to date is
> http://docs.cilium.io/en/latest/bpf/

Oh. If you're not updating the manpage, could you at least put a
reference to that other documentation in the manpage?
