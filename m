From: Milind Chabbi <chabbi.milind@gmail.com>
Subject: Re: [PATCH] perf/core: fast breakpoint modification via _IOC_MODIFY_BREAKPOINT
Date: Wed, 8 Nov 2017 07:02:22 -0800
Message-ID: <CAMmz+Ym4yyAAYw02EtxSG7Duv_Pkg3Z+cYrgmW5Esm8Mgdx4-w@mail.gmail.com>
References: <CAMmz+Y=Py0dw63tuww+Oa4rWi_Hghhs3DHmNX=Tf1Yt_JH4O+Q@mail.gmail.com>
 <20171106092305.GA16382@krava> <CAMmz+YkB955Na6wOMmgqZX_TxqsBh86FiLi8EXmOrg1vwm-fGA@mail.gmail.com>
 <20171108141522.GA6320@krava>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171108141522.GA6320@krava>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Olsa <jolsa@redhat.com>
Cc: Milind Chabbi <chabbi.milind@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org, Michael Kerrisk-manpages <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Andi Kleen <ak@linux.intel.com>, Kan Liang <kan.liang@intel.com>, Hari Bathini <hbathini@linux.vnet.ibm.com>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, Jin Yao <yao.jin@linux.intel.com>
List-Id: linux-man@vger.kernel.org

On Wed, Nov 8, 2017 at 6:15 AM, Jiri Olsa <jolsa@redhat.com> wrote:
> On Mon, Nov 06, 2017 at 07:04:40AM -0800, Milind Chabbi wrote:
>> Hi Jirka,
>>
>> I see the tabs in my sent email, do you have suggestions on how best to
>> send this patch so that the tabs are preserved by the email client?
>> Can anybody else also check if they received with/without tabs?
>>
>> release_bp_slot/reserve_bp_slot majic is not necessary since
>> _IOC_MODIFY_BREAKPOINT ioctl modifies an already registered breakpoint
>> without affecting the count of breakpoints active.
>
> but AFAICS you allow to change the breakpoint type (bp_type)
> and slot counts are based on the breakpoint type
>
> jirka

Jirka,
I am not able to fully understand your concern.
Can you point to a code file and line related to your observation?
The patch is modeled after the existing modify_user_hw_breakpoint() function
present in events/hw_breakpoint.c; don't you see this problem in that code?

-Milind
