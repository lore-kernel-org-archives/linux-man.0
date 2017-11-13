From: Milind Chabbi <chabbi.milind@gmail.com>
Subject: Re: [PATCH] perf/core: fast breakpoint modification via _IOC_MODIFY_BREAKPOINT
Date: Mon, 13 Nov 2017 00:02:56 -0800
Message-ID: <CAMmz+Y=95ffwgSbLSXoAPOrdQXVQftZNJFjoH=kjpGkZ2u2LYw@mail.gmail.com>
References: <20171108141522.GA6320@krava> <CAMmz+Ym4yyAAYw02EtxSG7Duv_Pkg3Z+cYrgmW5Esm8Mgdx4-w@mail.gmail.com>
 <20171108151218.GA11018@krava> <CAMmz+Y=PJ2kFf9mqoQDJY32VjpCQBCCuWOiHNXR3mSEzotSS_w@mail.gmail.com>
 <20171108155741.GA12627@krava> <CAMmz+Y=eq=S+gZaRefVUrfB7LDRVfD5UdpkfQXS0zvnHdNt0XA@mail.gmail.com>
 <20171109074658.GC14419@krava> <20171109131233.GA2942@krava>
 <CAMmz+Ykdf+bpA=ARSAYd3xp7U+BDWVmf1iW3SKW=ZVDBSmUSEg@mail.gmail.com>
 <CAMmz+YmhGXPQ_KydpPTLbPDQW-6G_wxrnAz2UYqSwqQJHBN_5Q@mail.gmail.com> <20171113074644.GA18733@krava>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171113074644.GA18733@krava>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Olsa <jolsa@redhat.com>
Cc: Milind Chabbi <chabbi.milind@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org, Michael Kerrisk-manpages <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Andi Kleen <ak@linux.intel.com>, Kan Liang <kan.liang@intel.com>, Hari Bathini <hbathini@linux.vnet.ibm.com>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, Jin Yao <yao.jin@linux.intel.com>
List-Id: linux-man@vger.kernel.org

SNIP

On Sun, Nov 12, 2017 at 11:46 PM, Jiri Olsa <jolsa@redhat.com> wrote:

> but you closed fd4 before openning fd5..?

Yes, that is correct. I closed fd4. The reason is by closing fd4, we
are having a total of 3 hardware breakpoints active, but we are making
the software counting in the kernel think that four TYPE_DATA
breakpoints active. The counting should have disallowed us from
creating fd5 as per the following logic in the kernel:

static int __reserve_bp_slot(struct perf_event *bp)

{
 ....

        /* Flexible counters need to keep at least one slot */
        if (slots.pinned + (!!slots.flexible) > nr_slots[type])
                return -ENOSPC;
....
}
