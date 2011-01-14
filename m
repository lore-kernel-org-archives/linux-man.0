From: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] fallocate.2: document FALLOC_FL_PUNCH_HOLE
Date: Fri, 14 Jan 2011 02:35:02 +0200
Message-ID: <AANLkTimeEM-Zrcr2-hRUCW1gO_NYCh9=6mTXo5f11dq3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0022152d6f610e0d120499c39c77
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--0022152d6f610e0d120499c39c77
Content-Type: text/plain; charset=UTF-8

This functionality landed in Linux 2.6.38 since:

commit 79124f18b335172e1916075c633745e12dae1dac
Author: Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Nov 17 20:46:15 2010 -0500

    fs: add hole punching to fallocate

    Hole punching has already been implemented by XFS and OCFS2, and has the
    potential to be implemented on both BTRFS and EXT4 so we need a
generic way to
    get to this feature.  The simplest way in my mind is to add
FALLOC_FL_PUNCH_HOLE
    to fallocate() since it already looks like the normal fallocate() operation.
    I've tested this patch with XFS and BTRFS to make sure XFS did what it's
    supposed to do and that BTRFS failed like it was supposed to.  Thank you,

CC: Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
CC: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Signed-off-by: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/fallocate.2 |   22 +++++++++++++++++++++-
 1 files changed, 21 insertions(+), 1 deletions(-)

--0022152d6f610e0d120499c39c77
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-fallocate.2-document-FALLOC_FL_PUNCH_HOLE.patch"
Content-Disposition: attachment;
	filename="0001-fallocate.2-document-FALLOC_FL_PUNCH_HOLE.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f963abf0e9f76012_0.1

ZGlmZiAtLWdpdCBhL21hbjIvZmFsbG9jYXRlLjIgYi9tYW4yL2ZhbGxvY2F0ZS4yDQppbmRleCA0
MmVlZmJkLi4xMjc5MTMwIDEwMDY0NA0KLS0tIGEvbWFuMi9mYWxsb2NhdGUuMg0KKysrIGIvbWFu
Mi9mYWxsb2NhdGUuMg0KQEAgLTMyLDcgKzMyLDcgQEAgYnl0ZXMuDQogVGhlDQogLkkgbW9kZQ0K
IGFyZ3VtZW50IGRldGVybWluZXMgdGhlIG9wZXJhdGlvbiB0byBiZSBwZXJmb3JtZWQgb24gdGhl
IGdpdmVuIHJhbmdlLg0KLUN1cnJlbnRseSBvbmx5IG9uZSBmbGFnIGlzIHN1cHBvcnRlZCBmb3IN
CitUaGVyZSBhcmUgdHdvIGZsYWcgdmFsdWVzIHN1cHBvcnRlZCBmb3INCiAuSVIgbW9kZSA6DQog
LlRQDQogLkIgRkFMTE9DX0ZMX0tFRVBfU0laRQ0KQEAgLTU5LDYgKzU5LDI2IEBAIGV2ZW4gaWYg
aXQgaXMgbGVzcyB0aGFuDQogLlwiIEFsbCBvZiB0aGUgYWJvdmUgZmxhZ3Mgd2VyZSBkZWJhdGVk
IHVwb24gYW5kIHdlIGNhbiBub3Qgc2F5DQogLlwiIGlmIGFueS93aGljaCBvbmUgb2YgdGhlc2Ug
ZmxhZ3Mgd2lsbCBtYWtlIGl0IHRvIHRoZSBsYXRlciBrZXJuZWxzLg0KIC5QUA0KKy5UUA0KKy5C
UiBGQUxMT0NfRkxfUFVOQ0hfSE9MRSAiIChzaW5jZSBMaW51eCAyLjYuMzgpDQorRGVhbGxvY2F0
ZSBzcGFjZSBpbnNpZGUgYSBmaWxlIGluIHRoZSBieXRlIHJhbmdlIHN0YXJ0aW5nIGF0DQorLkkg
b2Zmc2V0DQorYW5kIGNvbnRpbnVpbmcgZm9yDQorLkkgbGVuDQorYnl0ZXMuDQorUGFydGlhbCBm
aWxlc3lzdGVtIGJsb2NrcyBhcmUgemVyb2VkLCBhbmQNCit3aG9sZSBmaWxlc3lzdGVtIGJsb2Nr
cyBhcmUgcmVtb3ZlZCBmcm9tIHRoZSBmaWxlLg0KK0N1cnJlbnRseSB5b3UgY2FuIG9ubHkgaGF2
ZQ0KKy5CUiBGQUxMT0NfRkxfUFVOQ0hfSE9MRQ0KK3dpdGgNCisuQlIgRkFMTE9DX0ZMX0tFRVBf
U0laRQ0KK3NldCwNCitzbyB0aGUgZmlsZSBzaXplIChhcyByZXBvcnRlZCBieQ0KKy5CUiBzdGF0
ICgyKSkNCitkb2VzIG5vdCBjaGFuZ2UNCit3aGVuIGhvbGUgcHVuY2hpbmcsIGV2ZW4gd2hlbiBw
dWNoaW5nIHRoZSBlbmQgb2YNCithIGZpbGUgb2ZmLg0KKy5QUA0KIElmDQogLkIgRkFMTE9DX0ZM
X0tFRVBfU0laRQ0KIGZsYWcgaXMgbm90IHNwZWNpZmllZCBpbg0K
--0022152d6f610e0d120499c39c77--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
