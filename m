From: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: [bpf-next PATCH 0/5] bpf,
 doc: convert Documentation/bpf to RST-formatting
Date: Mon, 14 May 2018 15:42:06 +0200
Message-ID: <152630528901.29210.9018565600000101307.stgit@firesoul>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Daniel Borkmann <borkmann@iogearbox.net>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Jesper Dangaard Brouer <brouer@redhat.com>
Cc: netdev@vger.kernel.org, Quentin Monnet <quentin.monnet@netronome.com>, linux-man@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-man@vger.kernel.org

The kernel is moving files under Documentation to use the RST
(reStructuredText) format and Sphinx [1].  This patchset converts the
files under Documentation/bpf/ into RST format.  The Sphinx
integration is left as followup work.

[1] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html

This patchset have been uploaded as branch bpf_doc10 on github[2], so
reviewers can see how GitHub renders this.

[2] https://github.com/netoptimizer/linux/tree/bpf_doc10/Documentation/bpf

---

Jesper Dangaard Brouer (5):
      bpf, doc: add basic README.rst file
      bpf, doc: rename txt files to rst files
      bpf, doc: convert bpf_design_QA.rst to use RST formatting
      bpf, doc: convert bpf_devel_QA.rst to use RST formatting
      bpf, doc: howto use/run the BPF selftests


 Documentation/bpf/README.rst        |   36 ++
 Documentation/bpf/bpf_design_QA.rst |  221 ++++++++++++
 Documentation/bpf/bpf_design_QA.txt |  156 ---------
 Documentation/bpf/bpf_devel_QA.rst  |  640 +++++++++++++++++++++++++++++++++++
 Documentation/bpf/bpf_devel_QA.txt  |  570 -------------------------------
 5 files changed, 897 insertions(+), 726 deletions(-)
 create mode 100644 Documentation/bpf/README.rst
 create mode 100644 Documentation/bpf/bpf_design_QA.rst
 delete mode 100644 Documentation/bpf/bpf_design_QA.txt
 create mode 100644 Documentation/bpf/bpf_devel_QA.rst
 delete mode 100644 Documentation/bpf/bpf_devel_QA.txt
