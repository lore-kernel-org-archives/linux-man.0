From: Jiri Olsa <jolsa@redhat.com>
Subject: Re: [PATCH] perf/core: fast breakpoint modification via
 _IOC_MODIFY_BREAKPOINT
Date: Wed, 8 Nov 2017 15:15:22 +0100
Message-ID: <20171108141522.GA6320@krava>
References: <CAMmz+Y=Py0dw63tuww+Oa4rWi_Hghhs3DHmNX=Tf1Yt_JH4O+Q@mail.gmail.com>
 <20171106092305.GA16382@krava>
 <CAMmz+YkB955Na6wOMmgqZX_TxqsBh86FiLi8EXmOrg1vwm-fGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMmz+YkB955Na6wOMmgqZX_TxqsBh86FiLi8EXmOrg1vwm-fGA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milind Chabbi <chabbi.milind@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com, namhyung@kernel.org, linux-kernel@vger.kernel.org, Michael Kerrisk-manpages <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, mpe@ellerman.id.au, ak@linux.intel.com, kan.liang@intel.com, hbathini@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com, yao.jin@linux.intel.com
List-Id: linux-man@vger.kernel.org

On Mon, Nov 06, 2017 at 07:04:40AM -0800, Milind Chabbi wrote:
> Hi Jirka,
> 
> I see the tabs in my sent email, do you have suggestions on how best to
> send this patch so that the tabs are preserved by the email client?
> Can anybody else also check if they received with/without tabs?
> 
> release_bp_slot/reserve_bp_slot majic is not necessary since
> _IOC_MODIFY_BREAKPOINT ioctl modifies an already registered breakpoint
> without affecting the count of breakpoints active.

but AFAICS you allow to change the breakpoint type (bp_type)
and slot counts are based on the breakpoint type

jirka
