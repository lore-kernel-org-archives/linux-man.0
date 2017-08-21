From: Otto Ebeling <oebeling-YEAOTlfEoH7f77WrBdCPMDwVj7d+iGoU@public.gmane.org>
Subject: [patch] Update move_pages(2) manpage to match kernel change
Date: Mon, 21 Aug 2017 22:05:31 +0100
Message-ID: <e6c853bb0a1dd5f96133a754024f230c@github.mail.kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_e3d5a5528408317712cb08c2fe9af016"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--=_e3d5a5528408317712cb08c2fe9af016
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

Hi,

I recently reported a security bug to the kernel that caused a change to 
be made to the move_pages syscall (kernel commit 
197e7e521384a23b9e585178f3f11c9fa08274b9), the attached patch updates 
the man page to match the new behavior.

Thanks,
Otto Ebeling

--=_e3d5a5528408317712cb08c2fe9af016
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=man.diff
Content-Disposition: attachment;
 filename=man.diff;
 size=592

ZGlmZiAtLWdpdCBhL21hbjIvbW92ZV9wYWdlcy4yIGIvbWFuMi9tb3ZlX3BhZ2VzLjIKaW5kZXgg
ZGMzODkyYS4uMzkwZDIzYyAxMDA2NDQKLS0tIGEvbWFuMi9tb3ZlX3BhZ2VzLjIKKysrIGIvbWFu
Mi9tb3ZlX3BhZ2VzLjIKQEAgLTQ3LDkgKzQ3LDEwIEBAIGluZGljYXRlIGNvbnN0cmFpbnRzIG9u
IHRoZSBwYWdlcyB0byBiZSBtb3ZlZC4KIGlzIHRoZSBJRCBvZiB0aGUgcHJvY2VzcyBpbiB3aGlj
aCBwYWdlcyBhcmUgdG8gYmUgbW92ZWQuCiBUbyBtb3ZlIHBhZ2VzIGluIGFub3RoZXIgcHJvY2Vz
cywKIHRoZSBjYWxsZXIgbXVzdCBiZSBwcml2aWxlZ2VkCi0uUkIgKCBDQVBfU1lTX05JQ0UgKQot
b3IgdGhlIHJlYWwgb3IgZWZmZWN0aXZlIHVzZXIgSUQgb2YgdGhlIGNhbGxpbmcgcHJvY2VzcyBt
dXN0IG1hdGNoIHRoZQotcmVhbCBvciBzYXZlZC1zZXQgdXNlciBJRCBvZiB0aGUgdGFyZ2V0IHBy
b2Nlc3MuCisuUkIgKCBDQVBfU1lTX1BUUkFDRSApCitvciBvdGhlcndpc2UgaGF2ZSB0aGUgcGVy
bWlzc2lvbiB0byB1c2UKKy5CUiBwdHJhY2UgKDIpCitvbiB0aGUgdGFyZ2V0IHByb2Nlc3MuCiBJ
ZgogLkkgcGlkCiBpcyAwLCB0aGVuCg==
--=_e3d5a5528408317712cb08c2fe9af016--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
