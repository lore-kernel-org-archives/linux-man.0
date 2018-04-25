From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: [PATCH bpf-next v4 09/10] bpf: add documentation for eBPF helpers (65-66)
Date: Wed, 25 Apr 2018 18:17:00 +0100
Message-ID: <20180425171701.11048-10-quentin.monnet@netronome.com>
References: <20180425171701.11048-1-quentin.monnet@netronome.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180425171701.11048-1-quentin.monnet@netronome.com>
Sender: netdev-owner@vger.kernel.org
To: daniel@iogearbox.net, ast@kernel.org
Cc: netdev@vger.kernel.org, oss-drivers@netronome.com, quentin.monnet@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org, "Nikita V . Shirokov" <tehnerd@tehnerd.com>, Eyal Birger <eyal.birger@gmail.com>
List-Id: linux-man@vger.kernel.org

Add documentation for eBPF helper functions to bpf.h user header file.
This documentation can be parsed with the Python script provided in
another commit of the patch series, in order to provide a RST document
that can later be converted into a man page.

The objective is to make the documentation easily understandable and
accessible to all eBPF developers, including beginners.

This patch contains descriptions for the following helper functions:

Helper from Nikita:
- bpf_xdp_adjust_tail()

Helper from Eyal:
- bpf_skb_get_xfrm_state()

v4:
- New patch (helpers did not exist yet for previous versions).

Cc: Nikita V. Shirokov <tehnerd@tehnerd.com>
Cc: Eyal Birger <eyal.birger@gmail.com>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
---
 include/uapi/linux/bpf.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 335ac427d43b..3b91e22f68c1 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -1737,6 +1737,36 @@ union bpf_attr {
  * 		must be set to zero.
  * 	Return
  * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_xdp_adjust_tail(struct xdp_buff *xdp_md, int delta)
+ * 	Description
+ * 		Adjust (move) *xdp_md*\ **->data_end** by *delta* bytes. It is
+ * 		only possible to shrink the packet as of this writing,
+ * 		therefore *delta* must be a negative integer.
+ *
+ * 		A call to this helper is susceptible to change the underlaying
+ * 		packet buffer. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again, if the helper is used in combination with
+ * 		direct packet access.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_skb_get_xfrm_state(struct sk_buff *skb, u32 index, struct bpf_xfrm_state *xfrm_state, u32 size, u64 flags)
+ * 	Description
+ * 		Retrieve the XFRM state (IP transform framework, see also
+ * 		**ip-xfrm(8)**) at *index* in XFRM "security path" for *skb*.
+ *
+ * 		The retrieved value is stored in the **struct bpf_xfrm_state**
+ * 		pointed by *xfrm_state* and of length *size*.
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ *
+ * 		This helper is available only if the kernel was compiled with
+ * 		**CONFIG_XFRM** configuration option.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
  */
 #define __BPF_FUNC_MAPPER(FN)		\
 	FN(unspec),			\
-- 
2.14.1
