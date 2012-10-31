From: Justin Lebar <justin.lebar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] proc.5: statm's "shared" field refers to pages backed by files.
Date: Wed, 31 Oct 2012 17:06:49 -0400
Message-ID: <CAFWcpZ4sa=MhzOF8MPHUiq+__xgJkdBYTstAeTd5Q=_bZrNn+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=90e6ba613b302fd70d04cd6149c8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--90e6ba613b302fd70d04cd6149c8
Content-Type: text/plain; charset=UTF-8

I noticed that statm's "shared" field doesn't match the sum of all the
"shared" entries in smaps [1].

The kernel docs explain that statm's "shared" field is "number of
pages that are shared (i.e. backed by a file)" [2].  smaps appears to
call a page shared if it's mapped by at least two processes, which
explains this discrepancy.

I'm not a kernel hacker, but it appears to me they do mean "i.e." and
not "e.g." in the statm description: In
fs/proc/task_mmu.c::task_statm, I see

    *shared = get_mm_counter(mm, MM_FILEPAGES);

Here's a patch which updates the man page to match the (hopefully
correct) kernel docs.

Subject: [PATCH] proc.5: statm's "shared" field refers to pages backed by
 files.

---
 man5/proc.5 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 88af7c5..855a2e0 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -947,7 +947,7 @@ size       total program size
            (same as VmSize in \fI/proc/[pid]/status\fP)
 resident   resident set size
            (same as VmRSS in \fI/proc/[pid]/status\fP)
-share      shared pages (from shared mappings)
+share      shared pages (i.e., backed by a file)
 text       text (code)
 .\" (not including libs; broken, includes data segment)
 lib        library (unused in Linux 2.6)
--
1.7.10.4

I've also attached the patch in case gmail messes it up somehow.

-Justin

[1] https://bugzilla.mozilla.org/show_bug.cgi?id=807181
[2] http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Documentation/filesystems/proc.txt;h=a1793d670cd01bd374eddf54ffdfc768504291ff;hb=HEAD

--90e6ba613b302fd70d04cd6149c8
Content-Type: application/octet-stream;
	name="0001-proc.5-statm-s-shared-field-refers-to-pages-backed-b.patch"
Content-Disposition: attachment;
	filename="0001-proc.5-statm-s-shared-field-refers-to-pages-backed-b.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h8yxq3jh0

RnJvbSA4Zjg1YmU2MGQyYzc3YjZmNDAzMjA2MmQ0YzUzYjdmODViNmU0YjI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKdXN0aW4gTGViYXIgPGp1c3Rpbi5sZWJhckBnbWFpbC5jb20+
CkRhdGU6IFdlZCwgMzEgT2N0IDIwMTIgMTY6NTU6MTIgLTA0MDAKU3ViamVjdDogW1BBVENIXSBw
cm9jLjU6IHN0YXRtJ3MgInNoYXJlZCIgZmllbGQgcmVmZXJzIHRvIHBhZ2VzIGJhY2tlZCBieQog
ZmlsZXMuCgotLS0KIG1hbjUvcHJvYy41IHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWFuNS9wcm9jLjUgYi9tYW41
L3Byb2MuNQppbmRleCA4OGFmN2M1Li44NTVhMmUwIDEwMDY0NAotLS0gYS9tYW41L3Byb2MuNQor
KysgYi9tYW41L3Byb2MuNQpAQCAtOTQ3LDcgKzk0Nyw3IEBAIHNpemUgICAgICAgdG90YWwgcHJv
Z3JhbSBzaXplCiAgICAgICAgICAgIChzYW1lIGFzIFZtU2l6ZSBpbiBcZkkvcHJvYy9bcGlkXS9z
dGF0dXNcZlApCiByZXNpZGVudCAgIHJlc2lkZW50IHNldCBzaXplCiAgICAgICAgICAgIChzYW1l
IGFzIFZtUlNTIGluIFxmSS9wcm9jL1twaWRdL3N0YXR1c1xmUCkKLXNoYXJlICAgICAgc2hhcmVk
IHBhZ2VzIChmcm9tIHNoYXJlZCBtYXBwaW5ncykKK3NoYXJlICAgICAgc2hhcmVkIHBhZ2VzIChp
LmUuLCBiYWNrZWQgYnkgYSBmaWxlKQogdGV4dCAgICAgICB0ZXh0IChjb2RlKQogLlwiIChub3Qg
aW5jbHVkaW5nIGxpYnM7IGJyb2tlbiwgaW5jbHVkZXMgZGF0YSBzZWdtZW50KQogbGliICAgICAg
ICBsaWJyYXJ5ICh1bnVzZWQgaW4gTGludXggMi42KQotLSAKMS43LjEwLjQKCg==
--90e6ba613b302fd70d04cd6149c8--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
