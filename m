From: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: [bpf-next PATCH 1/5] bpf, doc: add basic README.rst file
Date: Mon, 14 May 2018 15:42:12 +0200
Message-ID: <152630533196.29210.2648172365646303402.stgit@firesoul>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <152630528901.29210.9018565600000101307.stgit@firesoul>
Sender: netdev-owner@vger.kernel.org
To: Daniel Borkmann <borkmann@iogearbox.net>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Jesper Dangaard Brouer <brouer@redhat.com>
Cc: netdev@vger.kernel.org, Quentin Monnet <quentin.monnet@netronome.com>, linux-man@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-man@vger.kernel.org

A README.rst file in a directory have special meaning for sites like
github, which auto renders the contents.  Plus search engines like
Google also index these README.rst files.

Auto rendering allow us to use links, for (re)directing eBPF users to
other places where docs live.  The end-goal would be to direct users
towards https://www.kernel.org/doc/html/latest but we haven't written
the full docs yet, so we start out small and take this incrementally.

This directory itself contains some useful docs, which can be linked
to from the README.rst file (verified this works for github).

Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
---
 Documentation/bpf/README.rst |   36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/bpf/README.rst

diff --git a/Documentation/bpf/README.rst b/Documentation/bpf/README.rst
new file mode 100644
index 000000000000..329469c33db8
--- /dev/null
+++ b/Documentation/bpf/README.rst
@@ -0,0 +1,36 @@
+=================
+BPF documentation
+=================
+
+This directory contains documentation for the BPF (Berkeley Packet
+Filter) facility, with a focus on the extended BPF version (eBPF).
+
+This kernel side documentation is still work in progress.  The main
+textual documentation is (for historical reasons) described in
+`Documentation/networking/filter.txt`_, which describe both classical
+and extended BPF instruction-set.
+The Cilium project also maintains a `BPF and XDP Reference Guide`_
+that goes into great technical depth about the BPF Architecture.
+
+The primary info for the bpf syscall is available in the `man-pages`_
+for `bpf(2)`_.
+
+
+
+Frequently asked questions (FAQ)
+================================
+
+Two sets of Questions and Answers (Q&A) are maintained.
+
+* QA for common questions about BPF see: bpf_design_QA_
+
+* QA for developers interacting with BPF subsystem: bpf_devel_QA_
+
+
+.. Links:
+.. _bpf_design_QA: bpf_design_QA.txt
+.. _bpf_devel_QA:  bpf_devel_QA.txt
+.. _Documentation/networking/filter.txt: ../networking/filter.txt
+.. _man-pages: https://www.kernel.org/doc/man-pages/
+.. _bpf(2): http://man7.org/linux/man-pages/man2/bpf.2.html
+.. _BPF and XDP Reference Guide: http://cilium.readthedocs.io/en/latest/bpf/
