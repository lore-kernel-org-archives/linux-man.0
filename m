From: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Subject: Re: [PATCH glibc] Linux: Include <linux/sockios.h> in <bits/socket.h>
 under __USE_MISC
Date: Mon, 22 Jul 2019 13:41:07 +0000
Message-ID: <2431941f-3aac-d31f-e6f5-8ed2ed7b2e5c@arm.com>
References: <87ftmys3un.fsf@oldenburg2.str.redhat.com>
 <CAK8P3a0hC4wvjwCi4=DCET3C4qARMY6c58ffjwG3b1ZPM6kr-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <libc-alpha-return-103876-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <CAK8P3a0hC4wvjwCi4=DCET3C4qARMY6c58ffjwG3b1ZPM6kr-A@mail.gmail.com>
Content-ID: <653E09513AC07444B39A4F60BE5EBB14@eurprd08.prod.outlook.com>
To: Arnd Bergmann <arnd@arndb.de>, Florian Weimer <fweimer@redhat.com>
Cc: nd <nd@arm.com>, GNU C Library <libc-alpha@sourceware.org>, Sergei
 Trofimovich <slyfox@gentoo.org>, Networking <netdev@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Michael Kerrisk <mtk.manpages@gmail.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

T24gMjIvMDcvMjAxOSAxMjozNCwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gT24gTW9uLCBKdWwg
MjIsIDIwMTkgYXQgMTozMSBQTSBGbG9yaWFuIFdlaW1lciA8ZndlaW1lckByZWRoYXQuY29tPiB3
cm90ZToNCj4+DQo+PiBIaXN0b3JpY2FsbHksIDxhc20vc29ja2V0Lmg+ICh3aGljaCBpcyBpbmNs
dWRlZCBmcm9tIDxiaXRzL3NvY2tldC5oPikNCj4+IHByb3ZpZGVkIGlvY3RsIG9wZXJhdGlvbnMg
Zm9yIHNvY2tldHMuICBVc2VyIGNvZGUgYWNjZXNzZWQgdGhlbQ0KPj4gdGhyb3VnaCA8c3lzL3Nv
Y2tldC5oPi4gIFRoZSBrZXJuZWwgVUFQSSBoZWFkZXJzIGhhdmUgcmVtb3ZlZCB0aGVzZQ0KPj4g
ZGVmaW5pdGlvbnMgaW4gZmF2b3Igb2YgPGxpbnV4L3NvY2tpb3MuaD4uICBUaGlzIGNvbW1pdCBt
YWtlcyB0aGVtDQo+PiBhdmFpbGFibGUgdmlhIDxzeXMvc29ja2V0Lmg+IGFnYWluLg0KPiANCj4g
TG9va3MgZ29vZCB0byBtZS4NCj4gDQo+IEkgd29uZGVyIGlmIHdlIHNob3VsZCBzdGlsbCBkbyB0
aGVzZSB0d28gY2hhbmdlcyBpbiB0aGUga2VybmVsOg0KPiANCj4gLSBpbmNsdWRlIGFzbS9zb2Nr
ZXQuaCBmcm9tIGxpbnV4L3NvY2tldC5oIGZvciBjb25zaXN0ZW5jeQ0KPiAtIG1vdmUgdGhlIGRl
ZmluZXMgdGhhdCBnb3QgbW92ZWQgZnJvbSBhc20vc29ja2lvcy5oIHRvIGxpbnV4L3NvY2tpb3Mu
aA0KPiAgIGJhY2sgdG8gdGhlIHByZXZpb3VzIGxvY2F0aW9uIHRvIGhlbHAgYW55b25lIHdobyBp
cyB1c2VyDQo+ICAgbmV3ZXIga2VybmVsIGhlYWRlcnMgd2l0aCBvbGRlciBnbGliYyBoZWFkZXJz
Lg0KDQpkb2VzIHVzZXIgY29kZSBhY3R1YWxseSBleHBlY3QgdGhlc2UgaW4gc3lzL3NvY2tldC5o
DQpvciBpbiBhc20vc29ja2V0LmggPw0KDQptYW4gNyBzb2NrZXQNCm1lbnRpb25zIFNJT0NHU1RB
TVAgYnV0IGRvZXMgbm90IHNheSB0aGUgaGVhZGVyLg0KDQptYW4gMiBpb2N0bF9saXN0DQpzcGVj
aWZpZXMgaW5jbHVkZS9hc20taTM4Ni9zb2NrZXQuaCBhcyB0aGUgbG9jYXRpb24uDQoNCmlmIHVz
ZXIgY29kZSB0ZW5kcyB0byBkaXJlY3RseSBpbmNsdWRlIGFzbS9zb2NrZXQuaA0KdGhlbiBpIHRo
aW5rIGl0J3MgYmV0dGVyIHRvIHVuZG8gdGhlIGtlcm5lbCBoZWFkZXINCmNoYW5nZSB0aGFuIHRv
IHB1dCB0aGluZ3MgaW4gc3lzL3NvY2tldC5oLg0KDQoobm90ZTogaW4gbXVzbCB0aGVzZSBpb2N0
bCBtYWNyb3MgYXJlIGluIHN5cy9pb2N0bC5oDQp3aGljaCBpcyBub3QgYSBwb3NpeCBoZWFkZXIg
c28gbmFtZXNwYWNlIHJ1bGVzIGFyZQ0KbGVzcyBzdHJpY3QgdGhhbiBmb3Igc3lzL3NvY2tldC5o
IGFuZCB1c2VycyB0ZW5kIHRvDQppbmNsdWRlIGl0IGZvciBpb2N0bCgpKQ0KDQo=
