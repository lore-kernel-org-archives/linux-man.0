From: "Jorgen S. Hansen" <jhansen-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] vsock.7: document VSOCK socket address family
Date: Fri, 1 Dec 2017 14:21:01 +0000
Message-ID: <E3D252DD-C8A5-47C7-8491-A205D451A992@vmware.com>
References: <20171130112153.13885-1-stefanha@redhat.com>
 <33989114-7BC7-455A-BE36-9EEC989DBDF1@vmware.com>
 <20171201130901.GA12803@stefanha-x1.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171201130901.GA12803-lxVrvc10SDRcolVlb+j0YCZi+YwRKgec@public.gmane.org>
Content-Language: en-US
Content-ID: <66DF206D195C0B45868D601B58B4C893-HX+pjaQZbrqcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dexuan Cui <decui-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

DQo+IE9uIERlYyAxLCAyMDE3LCBhdCAyOjA5IFBNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhh
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBOb3YgMzAsIDIwMTcgYXQgMDE6MjE6
MjZQTSArMDAwMCwgSm9yZ2VuIFMuIEhhbnNlbiB3cm90ZToNCj4+PiBPbiBOb3YgMzAsIDIwMTcs
IGF0IDEyOjIxIFBNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+IHdyb3Rl
Og0KPiANCj4gVGhhbmtzIGZvciB0aGUgcXVpY2sgcmV2aWV3IQ0KPiANCj4gSSBmb3Jnb3QgdG8g
YXNrIHlvdTogSXMgU09DS19ER1JBTSByZWxpYWJsZSBhbmQgaW4tb3JkZXIgb3ZlciBWTUNJPw0K
DQpObywgdGhhdCBpc27igJl0IGd1YXJhbnRlZWQuDQoNCj4gDQo+Pj4gKy5QUA0KPj4+ICtWYWxp
ZCBzb2NrZXQgdHlwZXMgYXJlDQo+Pj4gKy5CIFNPQ0tfU1RSRUFNDQo+Pj4gK2FuZA0KPj4+ICsu
QiBTT0NLX0RHUkFNIC4NCj4+IA0KPj4gVGhlIHNwYWNlIGhlcmUgcmVzdWx0cyBpbiBhIHNwYWNl
IGJldHdlZW4gU09DS19ER1JBTSBhbmQgdGhlIOKAnC7igJ0gaW4gdGhlIGZvcm1hdHRlZCB0ZXh0
LiBJcyB0aGF0IGludGVudGlvbmFsPw0KPiANCj4gSSBoYXZlbid0IGZpZ3VyZWQgb3V0IHRoZSBn
cm9mZiBzeW50YXggdG8gYXZvaWQgdGhlIHNwYWNlIDooLiAgQW55DQo+IGlkZWFzPw0KDQpMb29r
cyBsaWtlIG1hbiA3IHVuaXggaGFzIGEgZmV3IGV4YW1wbGVzIHdpdGggYm9sZCBhbmQg4oCcLOKA
nSAtIG1heWJlIGxvb2sgYXQgdGhlIHNvdXJjZSBmb3IgdGhhdC4NCg0KPiANCj4+IEFwYXJ0IGZy
b20gdGhlIG5pdHMsIHRoaXMgbG9va3MgZ3JlYXQuDQo+IA0KPiBQbGVhc2UgbGV0IG1lIGtub3cg
aWYgdGhlcmUgYXJlIGFueSBvdGhlciB0b3BpY3MgdGhhdCB3ZSBzaG91bGQgY292ZXIgaW4NCj4g
dGhlIG1hbiBwYWdlLg0KDQpTdXJlLCBJ4oCZbGwgZ2V0IGJhY2sgdG8geW91IHNvb24sIGlmIEkg
dGhpbmsgb2YgYW55dGhpbmcuDQoNClRoYW5rcywNCkpvcmdlbg==
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
