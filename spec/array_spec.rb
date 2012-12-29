# -*- coding: utf-8 -*-
describe Array do # テスト対象（クラス、ｋメソッド）を記述する
  context "空の場合" do # テスト対象の状態や状況を記述する
    before do # 前処理
      @array = []
    end
    it "sizeが0であること" do
      @array.size.should == 0
    end
  end
  context "要素が１つの場合" do
    before do
      @array = ["hello"]
    end
    it { @array.size.should == 1 }
    it { @array[0].should == "hello" }
  end
end
