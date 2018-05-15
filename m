From: Y Song <ys114321@gmail.com>
Subject: Re: [bpf-next PATCH 0/5] bpf, doc: convert Documentation/bpf to RST-formatting
Date: Mon, 14 May 2018 22:57:25 -0700
Message-ID: <CAH3MdRV_f+gN+pHDQOviM9th6i1Evaa_Vh6dKSJcXE9ymqSd1Q@mail.gmail.com>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <152630528901.29210.9018565600000101307.stgit@firesoul>
Sender: netdev-owner@vger.kernel.org
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: Daniel Borkmann <borkmann@iogearbox.net>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, netdev <netdev@vger.kernel.org>, Quentin Monnet <quentin.monnet@netronome.com>, linux-man@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Mon, May 14, 2018 at 6:42 AM, Jesper Dangaard Brouer
<brouer@redhat.com> wrote:
> The kernel is moving files under Documentation to use the RST
> (reStructuredText) format and Sphinx [1].  This patchset converts the
> files under Documentation/bpf/ into RST format.  The Sphinx
> integration is left as followup work.
>
> [1] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html
>
> This patchset have been uploaded as branch bpf_doc10 on github[2], so
> reviewers can see how GitHub renders this.
>
> [2] https://github.com/netoptimizer/linux/tree/bpf_doc10/Documentation/bpf
>
> ---
>
> Jesper Dangaard Brouer (5):
>       bpf, doc: add basic README.rst file
>       bpf, doc: rename txt files to rst files
>       bpf, doc: convert bpf_design_QA.rst to use RST formatting
>       bpf, doc: convert bpf_devel_QA.rst to use RST formatting
>       bpf, doc: howto use/run the BPF selftests

This initial conversion from .txt to .rst files look good to me. Ack
for the whole series.
Acked-by: Yonghong Song <yhs@fb.com>

>
>
>  Documentation/bpf/README.rst        |   36 ++
>  Documentation/bpf/bpf_design_QA.rst |  221 ++++++++++++
>  Documentation/bpf/bpf_design_QA.txt |  156 ---------
>  Documentation/bpf/bpf_devel_QA.rst  |  640 +++++++++++++++++++++++++++++++++++
>  Documentation/bpf/bpf_devel_QA.txt  |  570 -------------------------------
>  5 files changed, 897 insertions(+), 726 deletions(-)
>  create mode 100644 Documentation/bpf/README.rst
>  create mode 100644 Documentation/bpf/bpf_design_QA.rst
>  delete mode 100644 Documentation/bpf/bpf_design_QA.txt
>  create mode 100644 Documentation/bpf/bpf_devel_QA.rst
>  delete mode 100644 Documentation/bpf/bpf_devel_QA.txt
>
> --
