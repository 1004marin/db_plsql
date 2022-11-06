insert into customer values ('cus-001', 'john', '01000000001','incheon seogu 01');
insert into customer values ('cus-002', 'mark', '01000000002','incheon seogu 02');
insert into customer values ('cus-003', 'june', '01000000003','incheon seogu 03');
insert into customer values ('cus-004', 'tomas', '01000000004','incheon seogu 04');
insert into customer values ('cus-005', 'kate', '01000000005','incheon seogu 05');

/*분류*/
insert into sorttype values ('cereal');
insert into sorttype values ('vegetable');
insert into sorttype values ('fruit');
insert into sorttype values ('meat');
/*아무것도 담지 않았을 때*/
insert into sorttype values ('none');

/*물품*/
/*곡류*/
insert into item values ('it-001', 'wheat', '800', 'cereal', '7');
insert into item values ('it-002', 'rice', '600', 'cereal', '7');
insert into item values ('it-003', 'barley', '700', 'cereal', '7');
insert into item values ('it-004', 'bean', '900', 'cereal', '7');
insert into item values ('it-005', 'corn', '300', 'cereal', '7');

/*채소*/
insert into item values ('it-101', 'onion', '800', 'vegetable', '7');
insert into item values ('it-102', 'carrot', '600', 'vegetable', '7');
insert into item values ('it-103', 'tomato', '700', 'vegetable', '7');
insert into item values ('it-104', 'pumpkin', '900', 'vegetable', '7');
insert into item values ('it-105', 'cucumber', '300', 'vegetable', '7');
/*과일*/
insert into item values ('it-201', 'apple', '800', 'fruit', '7');
insert into item values ('it-202', 'banana', '600', 'fruit', '7');
insert into item values ('it-203', 'grape', '700', 'fruit', '7');
insert into item values ('it-204', 'oragne', '900', 'fruit', '7');
insert into item values ('it-205', 'kiwi', '300', 'fruit', '7');
/*고기*/
insert into item values ('it-301', 'cow', '800', 'meat', '7');
insert into item values ('it-302', 'pig', '600', 'meat', '7');
insert into item values ('it-303', 'chicken', '700', 'meat', '7');
insert into item values ('it-304', 'sheep', '900', 'meat', '7');
insert into item values ('it-305', 'fish', '300', 'meat', '7');
/*아무것도 담지 않았을 때*/
insert into item values ('none', 'none', '0', 'none', '0');

/*장바구니10개*/
/*customer당 장바구니*/
insert into basket values ('bas-001-1', 'cus-001');

insert into basket values ('bas-002-1', 'cus-002');
insert into basket values ('bas-002-2', 'cus-002');

insert into basket values ('bas-003-1', 'cus-003');
insert into basket values ('bas-003-2', 'cus-003');
insert into basket values ('bas-003-3', 'cus-003');

insert into basket values ('bas-004-1', 'cus-004');
insert into basket values ('bas-004-2', 'cus-004');

insert into basket values ('bas-005-1', 'cus-005');
insert into basket values ('bas-005-2', 'cus-005');

/*장바구니 세부사항*/
/*빈장바구니*/
insert into item_in_basket values ('none', 'bas-001-1', '0');

/*고객2의 물품1개*/
insert into item_in_basket values ('it-002', 'bas-002-1', '1');

insert into item_in_basket values ('it-003', 'bas-002-2', '1');

/*물품 3개 이상*/
/*고객3*/
insert into item_in_basket values ('it-001', 'bas-003-1', '1');
insert into item_in_basket values ('it-101', 'bas-003-1', '1');
insert into item_in_basket values ('it-201', 'bas-003-1', '3');

insert into item_in_basket values ('it-002', 'bas-003-2', '1');
insert into item_in_basket values ('it-102', 'bas-003-2', '2');
insert into item_in_basket values ('it-302', 'bas-003-2', '1');

insert into item_in_basket values ('it-003', 'bas-003-3', '1');
insert into item_in_basket values ('it-103', 'bas-003-3', '1');
insert into item_in_basket values ('it-203', 'bas-003-3', '3');

/*고객4*/
insert into item_in_basket values ('it-104', 'bas-004-1', '1');
insert into item_in_basket values ('it-204', 'bas-004-1', '1');
insert into item_in_basket values ('it-304', 'bas-004-1', '1');

insert into item_in_basket values ('it-105', 'bas-004-2', '1');
insert into item_in_basket values ('it-205', 'bas-004-2', '1');
insert into item_in_basket values ('it-305', 'bas-004-2', '1');
insert into item_in_basket values ('it-005', 'bas-004-2', '1');

/*고객5*/
insert into item_in_basket values ('it-101', 'bas-005-1', '1');
insert into item_in_basket values ('it-201', 'bas-005-1', '1');
insert into item_in_basket values ('it-301', 'bas-005-1', '1');
insert into item_in_basket values ('it-001', 'bas-005-1', '1');

insert into item_in_basket values ('it-001', 'bas-005-2', '1');
insert into item_in_basket values ('it-101', 'bas-005-2', '1');
insert into item_in_basket values ('it-201', 'bas-005-2', '1');

/*주문*/
insert into buy values ('buy-001', 'bas-002-1', '20220901', '0');
insert into buy values ('buy-002', 'bas-002-2', '20220902', '0');
insert into buy values ('buy-003', 'bas-003-1', '20220903', '1000');
insert into buy values ('buy-004', 'bas-003-2', '20220904', '1000');
insert into buy values ('buy-005', 'bas-003-3', '20220905', '0');
insert into buy values ('buy-006', 'bas-004-1', '20220906', '0');
insert into buy values ('buy-007', 'bas-004-2', '20220907', '0');
insert into buy values ('buy-008', 'bas-005-1', '20220908', '0');
/*주문이 아닌 장바구니*/
insert into buy values ('none', 'bas-001-1', 'none', '0');
insert into buy values ('none2', 'bas-005-2', 'none', '0');

/*환불*/
insert into refund values ('all', 'buy-001');
insert into refund values ('all', 'buy-002');
insert into refund values ('part', 'buy-005');
insert into refund values ('part', 'buy-006');
/*환불이아닌주문*/
insert into refund values ('none', 'buy-003');
insert into refund values ('none', 'buy-004');
insert into refund values ('none', 'buy-007');
insert into refund values ('none', 'buy-008');


/*리뷰*/
insert into review values ('rev-001', 'buy-001', 'it-002', 'cus-002', '3','좋아요굿굿');
insert into review values ('rev-002', 'buy-002', 'it-003', 'cus-002', '4','좋아요굿');

insert into review values ('rev-003', 'buy-003', 'it-004', 'cus-003', '3','굿굿');
insert into review values ('rev-004', 'buy-003', 'it-005', 'cus-003', '3','별로에요');
insert into review values ('rev-005', 'buy-003', 'it-101', 'cus-003', '5','재주문할래요');

insert into review values ('rev-006', 'buy-004', 'it-102', 'cus-003', '3','좋습니다');
insert into review values ('rev-007', 'buy-004', 'it-103', 'cus-003', '1','별로에요');
insert into review values ('rev-008', 'buy-004', 'it-104', 'cus-003', '3','괜찮아요');

insert into review values ('rev-009', 'buy-005', 'it-201', 'cus-003', '3','좋아요');
insert into review values ('rev-010', 'buy-005', 'it-202', 'cus-003', '5','좋아요');
insert into review values ('rev-011', 'buy-005', 'it-203', 'cus-003', '2','걍그래요');

insert into review values ('rev-012', 'buy-006', 'it-204', 'cus-004', '3','좋아요');
insert into review values ('rev-013', 'buy-006', 'it-205', 'cus-004', '4','좋아요');
insert into review values ('rev-014', 'buy-006', 'it-301', 'cus-004', '5','배송이빠르네요');

insert into review values ('rev-015', 'buy-007', 'it-302', 'cus-004', '5','배송이빠르네요');
insert into review values ('rev-016', 'buy-007', 'it-303', 'cus-004', '2','전 별로였어요');
insert into review values ('rev-017', 'buy-007', 'it-304', 'cus-004', '4','선물하고싶어요');

insert into review values ('rev-018', 'buy-008', 'it-305', 'cus-005', '2','배송이 너무느려요');
insert into review values ('rev-019', 'buy-008', 'it-105', 'cus-005', '5','지인에게 추천하고싶어요');
insert into review values ('rev-020', 'buy-008', 'it-001', 'cus-005', '5','배송이빠르네요');

/*고객_장바구니*/
insert into customer_basket values ('bas-001-1', 'cus-001', 'none');
insert into customer_basket values ('bas-002-1', 'cus-002', 'buy-001');
insert into customer_basket values ('bas-002-2', 'cus-002', 'buy-002');
insert into customer_basket values ('bas-003-1', 'cus-003', 'buy-003');
insert into customer_basket values ('bas-003-2', 'cus-003', 'buy-004');
insert into customer_basket values ('bas-003-3', 'cus-003', 'buy-005');
insert into customer_basket values ('bas-004-1', 'cus-004', 'buy-006');
insert into customer_basket values ('bas-004-2', 'cus-004', 'buy-007');
insert into customer_basket values ('bas-005-1', 'cus-005', 'buy-008');
insert into customer_basket values ('bas-005-2', 'cus-005', 'none');
